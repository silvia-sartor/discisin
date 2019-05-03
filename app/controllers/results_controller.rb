class ResultsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_category, only: [:index]

  def index

  end

  private

  def find_category
      @category = Category.find(params[:category_id])
      @event = Event.find(params[:event_id])
  end
end
