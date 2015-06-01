require "rails_helper"

RSpec.describe MainCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/main_categories").to route_to("main_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/main_categories/new").to route_to("main_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/main_categories/1").to route_to("main_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/main_categories/1/edit").to route_to("main_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/main_categories").to route_to("main_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/main_categories/1").to route_to("main_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/main_categories/1").to route_to("main_categories#destroy", :id => "1")
    end

  end
end
