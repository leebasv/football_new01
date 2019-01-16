class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :load_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update; end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "users.users_controller.not_found"
    redirect_to root_path
  end
end
