class MatchesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :find_event, only: [:new, :create, :edit]
  def new
    @match = Match.new
  end

  def create
    @match = Match.new
    @match.hometeam = Team.find(params[:match][:hometeam].to_i)
    @match.awayteam = Team.find(params[:match][:awayteam].to_i)
    @match.category = Category.find(params[:match][:category].to_i)
    @match.pool = Pool.find(params[:match][:pool].to_i)
    time = "#{params[:match]["day_time(1i)"]}-#{params[:match]["day_time(2i)"]}-#{params[:match]["day_time(3i)"]} #{params[:match]["day_time(4i)"]}:#{params[:match]["day_time(5i)"]}"
    @match.day_time = time
    @match.game_points = params[:match][:game_points] == "true" ? true : false
    @match.game_length = params[:match][:game_length].to_i

    if @match.save
      redirect_to event_path(params[:event_id])
    else
      render :new
    end
  end

  def edit
    find_match
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end

  private

  def match_params
    params.require(:match).permit(:pool, :day_time, :address, :category, :game_points, :game_length, :field, :hometeam, :awayteam)
  end
end
