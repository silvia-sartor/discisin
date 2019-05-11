class MatchesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :find_event, only: [:new, :create, :edit]
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    find_match
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end

  private

  def match_params
    params.require(:match).permit(:name, :day_time, :address, :category, :game_points, :game_length, :field, :hometeam_id, :awayteam_id )
  end
end
