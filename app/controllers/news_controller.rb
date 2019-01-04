class NewsController < ApplicationController
  before_action :load_new, :load_comments, only: :show
  def index
    @news = New.newest.paginate page: params[:page],
      per_page: Settings.news.page
  end

  def show
    @comment = Comment.new
  end

  private

  def load_new
    @new = New.find_by id: params[:id]
    return if @new
    flash[:warning] = t "news.controller.not_found"
    redirect_to root_path
  end

  def load_comments
    @comments = @new.comments.newest
  end
end
