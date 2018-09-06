# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_receipt
    OrderMailer.order_receipt(Order.first)
  end
end
