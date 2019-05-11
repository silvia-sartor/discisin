class TeamsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_team, only: [:show]

  def show
    @matches = Match.where(hometeam: @team).to_a
    @matches += Match.where(awayteam: @team).to_a
    @datetime = []
    @matches.each do |match|
      @datetime << match.day_time.strftime("%A %d,%B,%Y")
    end
    @datetime.uniq!.reverse.sort!
  end

private
  def team_params
    params.require(:team).permit(:name)
  end

  def find_team
    @team = Team.find(params[:id])
    @event = Event.find(params[:event_id])
  end

end
