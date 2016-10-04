class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  def date_list
    dates = []

	  for i in 0..6
		  if i === 0
			  date = "Today, " + Date.today.strftime("%B %-d, %Y")
			  dates.push(date)
		  elsif i===1
			  date = "Tomorrow, " + (Date.today + i).strftime("%B %-d, %Y")
			  dates.push(date)
		  else
			  date = Date.today + i
			  dates.push(date.strftime("%A, %B %-d, %Y"))
		  end
	  end
	
	  return dates 
  end
end
