require "spec_helper"

RSpec.describe ShowingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/showings").to route_to("showings#index")
    end

    it "routes to #new" do
      expect(:get => "/showings/new").to route_to("showings#new")
    end

    it "routes to #show" do
      expect(:get => "/showings/1").to route_to("showings#show", :id => "1")
    end

    it "routes to #homepage" do
      expect(:get => "/").to route_to("showings#homepage")
    end
    
    it "routes to #showdates" do
      expect(:get => "showings/date/October%2017,%202016").to route_to("showings#showdates", :date => (Date.today+1).strftime("%B %-d, %Y"))
    end

    it "routes to #edit" do
      expect(:get => "/showings/1/edit").to route_to("showings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/showings").to route_to("showings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/showings/1").to route_to("showings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/showings/1").to route_to("showings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/showings/1").to route_to("showings#destroy", :id => "1")
    end

  end
end
