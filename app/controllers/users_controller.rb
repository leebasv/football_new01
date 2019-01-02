class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :check_update, only: :update

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users.create.success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update; end

  private

  def check_update
    if @user.update_attributes user_params
      render json: {message: t("score_bet.controller.success_updated"),
                    type: Settings.success}
    else
      render json: {message: t("score_bet.controller.fail_updated"),
                    type: Settings.error}
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
