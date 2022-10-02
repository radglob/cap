class CalendarController < ApplicationController
  include CalendarHelper

  def index
    @date = Date.today
    @weeks = weeks_for_calendar(@date)
  end
end
