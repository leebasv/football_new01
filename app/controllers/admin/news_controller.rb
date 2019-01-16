class Admin::NewsController < Admin::BaseController
  skip_before_action :verify_authenticity_token, only: :destroy
  before_action :load_new, except: %i(index new create)

  def index
    @news = New.newest.paginate page: params[:page],
      per_page: Settings.news.per_page
  end

  def new
    @new = New.new
  end

  def edit; end

  def update
    if @new.update_attributes new_params
      flash[:success] = t "news.controller.new_updated"
      redirect_to admin_news_index_path
    else
      render :edit
    end
  end

  def create
    @new = New.new new_params
    @new.user_id = current_user.id
    if @new.save
      flash[:info] = t "news.create.success"
      redirect_to admin_news_index_path
    else
      flash[:danger] = t "news.create.error"
      render :new
    end
  end

  def destroy
    if @new.destroy
      flash[:success] = t "news.controller.new_deleted"
    else
      flash[:warning] = t "news.controller.failed"
    end
    redirect_to admin_news_index_path
  end

  private

  def load_new
    @new = New.find_by id: params[:id]
    return if @new
    flash[:warning] = t "news.controller.not_found"
    redirect_to new_path
  end

  def new_params
    params.require(:new).permit :id, :title, :content,
      :transfer, :image, :user_id
  end
end
