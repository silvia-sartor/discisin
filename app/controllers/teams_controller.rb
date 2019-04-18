class TeamsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_team, only: [:show]

  def show
    @matches = Match.where(hometeam_id: @team.id) + Match.where(awayteam_id: @team.id)
    @datetime = []
    @matches.each do |match|
      @datetime << match.day
    end
    @datetime.uniq!.sort!
  end

private
  def team_params
    params.require(:team).permit(:name)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
