module ApplicationHelper
	def date_list
		dates = [['Today, ', format_date(Date.today)]]
		dates << ['Tomorrow, ', format_date(Date.today + 1.days)]
		(2..6).each do |n|
		  dates << ["#{(Date.today + n.days).strftime('%A')}, ", format_date(Date.today + n.days)]
		end
	dates
  end

  def format_date(date)
  	date.strftime('%B %-d, %Y')
  end
end
