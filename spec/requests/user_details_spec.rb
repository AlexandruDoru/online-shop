require 'rails_helper'

RSpec.describe "UserDetails", type: :request do
  describe "GET /user_details" do
    it "works! (now write some real specs)" do
      get user_details_path
      expect(response).to have_http_status(200)
    end
  end
end
