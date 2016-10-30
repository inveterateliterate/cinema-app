class OrderMailer < ActionMailer::Base
	default from: 'clearviewcinemas16@gmail.com'

	def order_receipt(order)
		@order = order
		@showtime = Showing.find(@order.showing_id)
		@movie = Movie.find(@showtime.movie_id)
		mail(to: @order.cust_email, subject: "You've Purchased a Ticket!")
	end
end
