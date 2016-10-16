require "spec_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/orders").to route_to("orders#index")
    end

    it "routes to #new" do
      expect(:get => "/orders/new").to route_to("orders#new")
    end

    it "routes to #show" do
      expect(:get => "/orders/1").to route_to("orders#show", :id => "1")
    end

    it "routes to #homepage" do
      expect(:get => "/").to route_to("showings#homepage")
    end
    
    it "routes to #showdates" do
      expect(:get => "showings/date/October 17, 2016").to route_to("showings#showdates", :date => (Date.today+1).strftime("%B %-d, %Y"))
    end

    it "routes to #create" do
      expect(:post => "/orders").to route_to("orders#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/orders/1").to route_to("orders#destroy", :id => "1")
    end

  end
end
