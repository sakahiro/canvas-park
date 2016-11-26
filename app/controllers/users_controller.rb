# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
    redirect_to users_url, notice: 'User was not found' if @user.nil?
  end

  def user_params
    params.require(:user).permit(:user_name, :user_image)
  end
end
