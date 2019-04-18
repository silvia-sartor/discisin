class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @event = Event.find(params[:id])
    @matches = Match.where(event_id: @event.id)
    @datetime = []
    @locations = []
    @matches.each { |match|
      @datetime << match.day
      @locations << match.where
    }
    @datetime.uniq!
    @locations.uniq!
  end
end
