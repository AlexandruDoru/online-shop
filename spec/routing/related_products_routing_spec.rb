require "rails_helper"

RSpec.describe RelatedProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/related_products").to route_to("related_products#index")
    end

    it "routes to #new" do
      expect(:get => "/related_products/new").to route_to("related_products#new")
    end

    it "routes to #show" do
      expect(:get => "/related_products/1").to route_to("related_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/related_products/1/edit").to route_to("related_products#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/related_products").to route_to("related_products#create")
    end

    it "routes to #update" do
      expect(:put => "/related_products/1").to route_to("related_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/related_products/1").to route_to("related_products#destroy", :id => "1")
    end

  end
end
