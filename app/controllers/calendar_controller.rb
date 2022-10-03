class CalendarController < ApplicationController
  include CalendarHelper

  require 'ostruct'

  def index
    @date = Date.today
    @weeks = weeks_for_calendar(@date)
    @events = events_for_month(@date)
    request.variant = determine_variant
  end

  private

  def events_for_month(_)
    []
  end

  def determine_variant
    variant = nil
    variant = :mobile if mobile?
    variant
  end

  def mobile?
    request.user_agent =~ /Mobile|webOS/
  end
end
