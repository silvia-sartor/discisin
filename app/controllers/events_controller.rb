class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [:show]
  before_action :find_categories, only: [:show]

  def show
    @teams = @event.teams
    @matches = []
    @days = []
    @locations = []
    @teams.each { |team| @matches += Match.where(hometeam: team).to_a }
    @matches.each do |match|
      @days << match.day_time.strftime("%A %d,%B,%Y")
      @locations << match.address
    end
    @days.uniq!.reverse.sort!
    @locations.uniq!
  end

  private

  def event_params
    params.require(:event).permit(:name, :when, :city, :currency, :description, :links, :contact, :picture, :price)
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
end
