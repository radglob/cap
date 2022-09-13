module CalendarHelper
  def day_of_week(i)
    case i
    when 0
      'Sun'
    when 1
      'Mon'
    when 2
      'Tues'
    when 3
      'Wed'
    when 4
      'Thu'
    when 5
      'Fri'
    when 6
      'Sat'
    end
  end
end
