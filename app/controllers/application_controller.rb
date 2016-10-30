class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def date_list
  	dates = []
  		for i in 0..6
  			if i === 0
  				date = ["Today, ", Date.today.strftime("%B %-d, %Y")]
  				dates.push(date)
  			elsif i === 1
  				date = ["Tomorrow, ", (Date.today + i).strftime("%B %-d, %Y")]
  				dates.push(date)
  			else
  				date = ["#{(Date.today + i).strftime("%A")}, ", (Date.today + i).strftime("%B %-d, %Y")]
  				dates.push(date)
  			end
  		end
	return dates
  end

def format_list
	dates = date_list
	list = []
	dates.each do |x|
		list.push(x.join(""))
	end
end

end