class MatchesController < ApplicationController
  before_action :load_match, only: :show
  def index
    @matches = Match.newest.paginate page: params[:page],
      per_page: Settings.matches.page
  end

  def show; end

  private

  def load_match
    @match = Match.find_by id: params[:id]
    return if @match
    flash[:danger] = t "matches.show.not_found"
    redirect_to matches_path
  end
end
