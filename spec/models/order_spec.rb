require 'spec_helper'

RSpec.describe Order, type: :model do
  before(:all) do
    @auditorium = FactoryBot.create(:auditorium)
    @movie = FactoryBot.create(:movie)
    @showing = FactoryBot.create(:showing)
    @order = FactoryBot.create(:order)
  end
 
  after(:all) do
 	  unless @order.destroyed?
      @order.destroy
      @showing.destroy
      @movie.destroy
      @auditorium.destroy
    end
  end
  
  it { should validate_presence_of(:cust_last) }
  it { should validate_presence_of(:cust_first) }
  it { should validate_presence_of(:cust_email) }
  it { should validate_presence_of(:cc_num) }
  it { should validate_presence_of(:cc_exp) }
  it { should validate_presence_of(:sale) }
  it { should validate_presence_of(:showing_id) }
end