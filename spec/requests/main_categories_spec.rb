require 'rails_helper'

RSpec.describe "MainCategories", type: :request do
  describe "GET /main_categories" do
    it "works! (now write some real specs)" do
      get main_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
