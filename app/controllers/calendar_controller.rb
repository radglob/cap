class CalendarController < ApplicationController
  include CalendarHelper

  require 'ostruct'

  def index
    @date = Date.today
    @weeks = weeks_for_calendar(@date)
    @events = events_for_month(@date)
  end

  private

  def events_for_month(_)
    []
  end
end
