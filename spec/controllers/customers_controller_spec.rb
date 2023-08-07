require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "GET /index" do
    it "renders a successful response" do
      # Customer.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it "renders a successful response - http status method" do
      # Customer.create! valid_attributes
      get :index
      puts response.inspect
      expect(response).to have_http_status(200)
    end
  end
end
