require 'spec_helper'

RSpec.describe Order, type: :model do
  	before(:all) do
  		@auditorium = Auditorium.create(capacity: 40)
  		@showing = Showing.create(date: Date.today, showtime: TIme.now + 1, movie_id: 1, auditorium_id: @auditorium.id)
	end
 
	after(:all) do
 		if !@order.destroyed?
    		@order.destroy
    		@auditorium.destroy
    		@showing.destroy
  		end
	end
 
	it "decreases a showing's available seats by 1 after save" do
		@order = Order.create(cust_last: "Smith", cust_first: "John", cust_email: "clearviewcinemas16@gmail.com", cc_num: 1234567891011121, cc_exp: Date.today+1, sale: 8.00, showing_id: @showing.id)
		expect(@showing.avail_seats).to change(@showing.avail_seats).by(1) 		
	end

	it 'sends an email' do
		expect(subject.send_)

	it { should validate_presence_of(:cust_last) }
	it { should validate_presence_of(:cust_first) }
	it { should validate_presence_of(:cust_email) }
	it { should validate_presence_of(:cc_num) }
	it { should validate_presence_of(:cc_exp) }
	it { should validate_presence_of(:sale) }
	it { should validate_presence_of(:showing_id) }

end