class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.all.sort_by { |obj| obj.when }.reverse
  end
end
