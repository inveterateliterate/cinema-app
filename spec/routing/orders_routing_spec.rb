require "spec_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/orders").to route_to("orders#index")
    end

    it "routes to #new" do
      expect(:get => "/orders/new/1").to route_to("orders#new", :showing => "1")
    end

    it "routes to #show" do
      expect(:get => "/orders/1").to route_to("orders#show", :id => "1")
    end

    it "routes to #filter" do
      expect(:get => "orders/movies/1").to route_to("orders#filter", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/orders").to route_to("orders#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/orders/1").to route_to("orders#destroy", :id => "1")
    end

  end
end
