module CalendarHelper
  def day_of_week(wday)
    Date::DAYNAMES[wday]
  end

  # Generates a range of dates from the first day of the first week of the month (which may be before the
  # start of the month) until the last day of the last week of the month (which also may not be within the
  # month.
  def weeks_for_calendar(date)
    first_day_of_month = date.at_beginning_of_month
    offset = first_day_of_month.wday.days
    first_day_of_first_week = first_day_of_month - offset
    last_day_of_month = date.at_end_of_month
    offset = (last_day_of_month.wday - 6).days
    last_day_of_last_week = last_day_of_month - offset
    (first_day_of_first_week..last_day_of_last_week).each_slice(7).to_a
  end
end
