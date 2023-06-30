require 'cancancan'
class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to root_path, notice: 'You have been signed out successfully.'
    else
      @user = User.find(params[:id])
      redirect_to root_path, alert: 'User not found.' if @user.nil?
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return unless @user.save

    redirect_to action: 'list'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    return unless @user.update_attributes(user_params)

    redirect_to action: 'show', id => @user
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
