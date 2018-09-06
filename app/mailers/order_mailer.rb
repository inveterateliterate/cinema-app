class OrderMailer < ActionMailer::Base
  default from: ENV['GMAIL_USERNAME']

  def order_receipt(order)
    @order = order
    @showtime = @order.showing
    @movie = @showtime.movie
    mail(to: @order.cust_email, subject: "You've Purchased a Ticket!")
  end
end
