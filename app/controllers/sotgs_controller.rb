class SotgsController < ApplicationController
  skip_before_action :authenticate_user!
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
  end

private
  def sotg_params
    params.require(:sotg).permit(:sotg_score5, :sotg_score1, :sotg_score2, :sotg_score3, :sotg_score4, :voting_team_id, :voted_team_id, :match_id, :event_id)
  end

  def find_sotg
    @sotg = Sotg.find(params[:id])
  end

  def classification(pool)
    @classific = []
    @teams.each do |teameach|
      same_pool_team = Match.where(name: pool, hometeam: teameach) + Match.where(name: pool, awayteam: teameach)
      if same_pool_team.empty?
      else
        #  [[team, points, games, dftot,ms tot, md]]
        team_seed = { :team => teameach, :pt => 0, :game => 0, :w => 0, :l => 0, :mf => 0, :ms => 0, :md => 0 }
        same_pool_team.each do |match|
          if match.hometeam_score
            game = Point.where(match: match, team: teameach).first
            team_seed[:pt] += game.pt
            game.pt >= 2 ? team_seed[:w] += 1 : team_seed[:l] += 1
            team_seed[:game] += 1
            team_seed[:mf] += game.metefatte
            team_seed[:ms] -= game.metesubite
            team_seed[:md] += game.metedifference
          end
        end
        @classific << team_seed
      end
    end
    @classific.sort_by { |a| [a[:pt], a[:mf], a[:ms], a[:md]] }.reverse
  end
end
