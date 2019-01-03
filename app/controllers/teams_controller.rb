class TeamsController < ApplicationController
  before_action :load_teams, only: :index

  def index; end

  private

  def load_teams
    @teams = Team.newest.search_by_country(params[:search]).paginate page: params[:page],
      per_page: Settings.teams.page
    return if @teams.any?
    flash[:error] = t "teams.controller.not_found"
    redirect_to root_path
  end
end
