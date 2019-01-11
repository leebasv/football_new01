class Admin::NotificationsController < Admin::BaseController
  skip_before_action :verify_authenticity_token, only: :destroy
  before_action :load_notification, only: :destroy

  def index
    @notifications = Notification.newest.paginate page: params[:page],
      per_page: Settings.notifies.page
  end

  def destroy
    if @notification.destroy
      flash[:success] = t "notifications.controller.deleted_success"
    else
      flash[:warning] = t "notifications.controller.deleted_failed"
    end
    redirect_to admin_notification_path
  end

  private

  def load_notification
    @notification = Notification.find_by id: params[:id]
    return if @notification
    flash[:warning] = t "notifications.controller.not_found"
    redirect_to admin_notification_path
  end
end
