class UsersController < ApplicationController
  before_action :set_user, except: :new
  before_action :authorization

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :second_name, :first_phone, :second_phone, :gender, :birth_date, :email,
                                 :nickname, :avatar, :city_id, :gender)
  end

  def authorization
    authorize @user
  end
end
