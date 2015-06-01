require "rails_helper"

RSpec.describe UserDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_details").to route_to("user_details#index")
    end

    it "routes to #new" do
      expect(:get => "/user_details/new").to route_to("user_details#new")
    end

    it "routes to #show" do
      expect(:get => "/user_details/1").to route_to("user_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_details/1/edit").to route_to("user_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_details").to route_to("user_details#create")
    end

    it "routes to #update" do
      expect(:put => "/user_details/1").to route_to("user_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_details/1").to route_to("user_details#destroy", :id => "1")
    end

  end
end
