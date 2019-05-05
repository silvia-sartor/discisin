class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def find_category
    @category = Category.find(params[:category_id])
    @event = Event.find(params[:event_id])
  end

  def find_teams
    @teams = Team.where(category: @category, accepted: true)
  end

  def find_matches
    @datetime = []
    @locations = []
    @pools = []
    @teams.each { |team|
      @matches = Match.where(hometeam: team, game_points: true)
      @matches.each { |match|
        @pools << match.name
        @datetime << match.day_time
        @locations << match.address
      }
    }
    @datetime.uniq!.sort!
    @locations.uniq!
    @pools.uniq!
  end
end
