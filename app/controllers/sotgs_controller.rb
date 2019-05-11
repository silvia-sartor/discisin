class SotgsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_sotg, only: [:new]

  def new
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
    @sotg.total = sotg.sotg1 + sotg.sotg2 + sotg.sotg3 + sotg.sotg4 + sotg.sotg5

    if @sotg.save
      redirect_to event_team_path(params[:event_id], @sotg.voted_team)
    else
      render :new
    end
  end

  def index
    find_category
    find_teams
    find_matches
    classification
  end

private

  def sotg_params
    params.require(:sotg).permit(:sotg5, :sotg1, :sotg2, :sotg3, :sotg4, :voting_team_id, :voted_team_id, :match_id, :event_id)
  end

  def find_sotg
    @sotg = Sotg.find(params[:id])
  end

  def classification
    @classific = []
    @teams.each do |teameach|
      same_team = Sotg.where(voted_team: teameach)
      #  [[team, points, games, dftot,ms tot, md]]
      team_sotg = { :team => teameach, :sotg1 => 0, :sotg2 => 0, :sotg3 => 0, :sotg4 => 0, :sotg5 => 0, :total => 0 }
      same_team.each do |sotg|
        team_sotg[:sotg1] += sotg.sotg1
        team_sotg[:sotg2] += sotg.sotg2
        team_sotg[:sotg3] += sotg.sotg3
        team_sotg[:sotg4] += sotg.sotg4
        team_sotg[:sotg5] += sotg.sotg5
        team_sotg[:total] += sotg.total
      end
      @classific << team_sotg.each { |key, value| value = key != :team ? value / same_team.count : value }
      @classific.sort_by! { |a| [a[:total]] }.reverse!
    end
  end
end
