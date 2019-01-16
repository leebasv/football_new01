class Admin::LeaguesController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_league, except: [:index, :new, :create]
  skip_before_action :verify_authenticity_token, only: :destroy

  def index
    @leagues = League.newest.paginate page: params[:page],
      per_page: Settings.leagues.page
  end

  def new
    @league = League.new
  end

  def edit; end

  def update
    if @league.update_attributes league_params
      flash[:success] = t "leagues
        .leagues_controller.league_updated"
      redirect_to admin_leagues_path
    else
      render :edit
    end
  end

  def create
    @league = League.new league_params
    if @league.save
      flash[:info] = t "leagues.create.success"
      redirect_to admin_leagues_path
    else
      flash[:danger] = t "leagues.create.error"
      render :new
    end
  end

  def destroy
    if @league.destroy
      flash[:success] = t "leagues
        .leagues_controller.match_resuilt_deleted"
    else
      flash[:warning] = t "leagues.leagues_controller.failed"
    end
    redirect_to admin_leagues_path
  end

  private

  def load_league
    @league = League.find_by id: params[:id]
    return if @league

    flash[:warning] = t "leagues.leagues_controller.not_found"
    redirect_to admin_league_path
  end

  def league_params
    params.require(:league).permit :name, :country, :end_date, :number_of_round,
      :continent, :number_of_match, :number_of_team, :match_time, :start_date
  end
end
