class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [:show, :results]
  before_action :find_matches, only: [:show, :results]
  before_action :find_teams, only: [:show,:results]

  def show
  end

  def results
    @teampools = []
    @teams.each { |team|
      @teampools << team
    }
    @teampools.uniq!

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

  def find_matches
    @matches = Match.where(event: @event)
        @datetime = []
    @locations = []
    @pools = []
    @matches.each { |match|
      @pools << match.name
      @datetime << match.day
      @locations << match.where
    }
    @datetime.uniq!.sort!
    @locations.uniq!
    @pools.uniq!
  end

  def find_teams
    @teams = Team.where(event: @event, accepted: true)
  end
end
