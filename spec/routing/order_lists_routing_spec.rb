require "rails_helper"

RSpec.describe OrderListsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_lists").to route_to("order_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/order_lists/new").to route_to("order_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/order_lists/1").to route_to("order_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_lists/1/edit").to route_to("order_lists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_lists").to route_to("order_lists#create")
    end

    it "routes to #update" do
      expect(:put => "/order_lists/1").to route_to("order_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_lists/1").to route_to("order_lists#destroy", :id => "1")
    end

  end
end
