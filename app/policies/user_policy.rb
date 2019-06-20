class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.moderator? || record == user
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.moderator? || record == user
  end
end

