class ItemPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user&.admin? || user&.moderator? || record&.user_id == user&.id
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin? || user&.moderator? || record&.user_id == user&.id
  end

  def show?
    true
  end
end
