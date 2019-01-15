class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :check_update, only: :update
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update; end

  private

  def check_update
    if @user.update_attributes user_params
      flash[:success] = t "score_bet.controller.success_updated"
      redirect_to user_path(@user)
    else
      flash[:error] = t "score_bet.controller.fail_updated"
      render :edit
    end
  end

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
