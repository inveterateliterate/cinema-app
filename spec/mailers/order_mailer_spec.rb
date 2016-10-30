require "spec_helper"

RSpec.describe OrderMailer, type: :mailer do

	before(:each) do
		@movie = FactoryGirl.create(:movie)
  		@showing = FactoryGirl.create(:showing)
 		@order = FactoryGirl.create(:order)
    ActionMailer::Base.delivery_method = :test
    @mail = described_class.order_receipt(@order).deliver_now
  end
  after(:each) do
    order = Order.find_by_cust_email("clearviewcinemas16@gmail.com")
    if !order.nil?
      	order.destroy
    end
  end
  
  describe 'order receipt email' do
  	it 'renders the subject' do
  		expect(@mail.subject).to eq("You've Purchased a Ticket!")
  	end

  	it 'renders the receiver email' do
  		expect(@mail.to).to eq([@order.cust_email])
  	end

  	it 'renders the sender email' do
  		expect(@mail.from).to eq(["clearviewcinemas16@gmail.com"])
  	end

  	it 'assigns the first name' do
  		expect(@mail.body.encoded).to match(@order.cust_first)
  	end

  	it 'assigns the movie' do
		expect(@mail.body.encoded).to match(@movie.title)
  	end

  	it 'assigns the showtime' do
  		expect(@mail.body.encoded).to match(@showing.showtime.strftime("%A, %D"))
  	end

  	it 'assigns the showtime' do
  		expect(@mail.body.encoded).to match(@showing.showtime.strftime("%l:%M %p"))
  	end


  end
end
