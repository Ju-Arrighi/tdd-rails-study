require 'rails_helper'
require 'rspec/rails'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works status 200" do
      get customers_path
      expect(response).to have_http_status(200)
    end
    it "index - JSON 200 ok" do
      get '/customers.json'
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_a_kind_of String),
        email: (be_a_kind_of String),
        # id: 1,
        # name: "Earle Friesen",
        # email: "meu_email_1@email.com",
      ])
    end
    it "show - JSON 200 ok" do
      get '/customers/1.json'
      expect(response.body).to include_json(
        id: 1
      )
    end
    it 'create - JSON'do
      member = create(:member)
      # login_as(member, :scope => :member)
      # sign_in @member
      login_as member, :scope => :member
      headers = { "ACCEPT" => "application/json" }
      customers_params = attributes_for(:customer)
      post "/customers.json", params: { customer: customers_params }, header: headers
      p member
      p customers_params
    end
  end
end
