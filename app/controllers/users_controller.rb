class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name)
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