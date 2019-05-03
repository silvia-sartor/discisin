class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [:show, :results]
  before_action :find_matches, only: [:show, :results]

  def show
    find_categories
    @teams = @event.teams
    @matches =[]
    @days =[]
    @locations =[]
    @teams.each  do |team|
      @matches += Match.where(hometeam: team).to_a
    end
    @matches.each do |match|
      @days << match.day_time.strftime("%A %d,%B,%Y")
      @locations << match.address
    end
    @days.uniq!.reverse.sort!
    @locations.uniq!
  end

  def results
    @pool_seeding =[]
    @pools.each do |pool|
      @pool_seeding << [pool,classification(pool)]
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

  def find_event
    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.find(params[:id])
    end
  end

  def find_categories
    @categories = @event.categories
  end

  def find_matches

  end

  def classification(pool)
    @classific = []
    @teams.each do |teameach|
      same_pool_team = Match.where(category: teameach.category, name: pool, hometeam: teameach) + Match.where(event: @event, name: pool, awayteam: teameach)
      if same_pool_team.empty?
      else
        #  [[team, points, games, dftot,ms tot, md]]
        team_seed = { :team => teameach, :pt => 0, :game => 0, :w => 0, :l => 0, :mf => 0, :ms => 0, :md => 0 }
        same_pool_team.each do |match|
          game = Point.where(match: match, team: teameach).first
          team_seed[:pt] += game.pt
          game.pt >= 2 ? team_seed[:w] += 1 : team_seed[:l] += 1
          team_seed[:game] += 1
          team_seed[:mf] += game.metefatte
          team_seed[:ms] += game.metesubite
          team_seed[:md] += game.metedifference
        end
        @classific << team_seed
      end
    end
    @classific.sort do |a, b|
      a[:mf]<=>b[:mf]
    end.reverse
  end
end
