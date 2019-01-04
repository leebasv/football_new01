class Admin::BaseController < ApplicationController
  include MatchesHelper
  before_action :logged_in
  before_action :require_admin

  layout "admin"

  private
  def logged_in
    return unless current_user.nil?
    redirect_to login_path
  end

  def require_admin
    return if current_user.admin?
    flash[:danger] = t "base.no_admin"
    redirect_to root_path
  end
end
