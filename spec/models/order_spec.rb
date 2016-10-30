require 'spec_helper'
##needs to be updated
RSpec.describe Order, type: :model do
  	before(:all) do
  		@auditorium = FactoryGirl.create(:auditorium)
  		@movie = FactoryGirl.create(:movie)
  		@showing = FactoryGirl.create(:showing)
  		@order = FactoryGirl.create(:order)
	end
 
	after(:all) do
 		if !@order.destroyed?
    		@order.destroy
    		@auditorium.destroy
    		@showing.destroy
  		end
	end
 	
 	describe 'Order' do
 		
	it "decreases a showing's available seats by 1 after save" do
		@order.save
		decreased = @auditorium.capacity - 1
		expect(@showing.avail_seats).to eq(decreased)
	end

	it { should validate_presence_of(:cust_last) }
	it { should validate_presence_of(:cust_first) }
	it { should validate_presence_of(:cust_email) }
	it { should validate_presence_of(:cc_num) }
	it { should validate_presence_of(:cc_exp) }
	it { should validate_presence_of(:sale) }
	it { should validate_presence_of(:showing_id) }

	end
end