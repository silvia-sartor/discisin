class ResultsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_category, only: [:index]

  def index
    find_teams
    find_matches
    @pool_seeding =[]
    @pools.each do |pool|
      @pool_seeding << [pool, classification(pool)]
    end
  end

  private

  def classification(pool)
    @classific = []
    @teams.each do |teameach|
      same_pool_team = Match.where(pool: pool, hometeam: teameach) + Match.where(pool: pool, awayteam: teameach)
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
