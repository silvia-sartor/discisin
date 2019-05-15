class MatchesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :find_event, only: [:new, :create, :edit, :update]
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save!
      redirect_to event_path(params[:event_id])
    else
      render :new
    end
  end

  def edit
    find_match
  end

  def update
    find_match
    if @match.update(match_params)
      redirect_to event_path(params[:event_id])
    else
      render :edit
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end

  private

  def match_params
    params.require(:match).permit(:pool_id, :day_time, :address, :category_id, :game_points, :game_length, :field, :hometeam_id, :awayteam_id)
  end
end
