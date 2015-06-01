require 'rails_helper'

RSpec.describe "OrderLists", type: :request do
  describe "GET /order_lists" do
    it "works! (now write some real specs)" do
      get order_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
