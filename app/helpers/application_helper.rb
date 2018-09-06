module ApplicationHelper
  def date_list
    today = Date.today
    dates = [['Today, ', format_date(today)]]
    dates << ['Tomorrow, ', format_date(today + 1.days)]
    (2..6).each do |n|
      dates << ["#{(today + n.days).strftime('%A')}, ", format_date(today + n.days)]
    end
    dates
  end

  def format_date(date)
    date.strftime('%B %-d, %Y')
  end
end
