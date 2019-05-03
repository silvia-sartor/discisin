class SotgsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_sotg, only: [:show]

  def new
    @event = Event.find(params[:event_id])
    @current_team = Team.find(params[:voting_team_id])
    @match = Match.find(params[:match_id])
    @sotg = Sotg.new
    @opposing_team = @match.hometeam == @current_team ? @match.awayteam : @match.hometeam
  end

  def create
    @sotg = Sotg.new(sotg_params)
    @sotg.match_id = params[:match_id]
    @sotg.voted_team_id = params[:sotg][:voted_team_id]
    @sotg.voting_team_id = params[:sotg][:voting_team_id]

    if @sotg.save
      redirect_to event_team_path(params[:event_id], @sotg.voted_team)
    else
      render :new
    end
  end

private
  def sotg_params
    params.require(:sotg).permit(:sotg_score5,:sotg_score1,:sotg_score2, :sotg_score3, :sotg_score4, :voting_team_id, :voted_team_id, :match_id, :event_id)
  end

  def find_sotg
    @sotg = Sotg.find(params[:id])
  end
end
