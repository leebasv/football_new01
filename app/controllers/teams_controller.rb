class TeamsController < ApplicationController
  before_action :load_teams, only: :index

  def index
    @search = Team.search(params[:q])
    @teams = @search.result.newest
  end

  private

  def load_teams
    @teams = Team.newest.paginate page: params[:page], per_page: Settings.teams.page
  end
end
