module Admin::MatchesHelper
  def get_teams name
    Team.order(name)
  end
end
