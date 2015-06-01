require 'rails_helper'

RSpec.describe "RelatedProducts", type: :request do
  describe "GET /related_products" do
    it "works! (now write some real specs)" do
      get related_products_path
      expect(response).to have_http_status(200)
    end
  end
end
