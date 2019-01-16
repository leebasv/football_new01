class Admin::BaseController < ApplicationController
  include MatchesHelper
  before_action :authenticate_user!, :require_admin

  layout "admin"

  private
  def require_admin
    return if user_signed_in? && current_user.admin?
    raise CanCan::AccessDenied
    redirect_to root_path
  end
end
