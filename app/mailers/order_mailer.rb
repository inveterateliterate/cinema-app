class OrderMailer < ActionMailer::Base
	default from: 'clearviewcinemas16@gmail.com'

	def order_receipt(order)
		@order = order
		@showtime = @order.showing
		@movie = @showtime.movie
		mail(to: @order.cust_email, subject: "You've Purchased a Ticket!")
	end
end
