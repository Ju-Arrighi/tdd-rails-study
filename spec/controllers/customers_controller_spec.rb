require 'rails_helper'
require 'rspec/rails'

RSpec.describe CustomersController, type: :controller do
  describe "GET /index" do
    it "renders a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "renders a successful response - http status method" do
      get :index
      expect(response).to have_http_status(200)
      # puts response.inspect
    end
  end

  describe "GET /show" do
    it "status 302 - not authorized" do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      # puts customer.id
      expect(response).to have_http_status(302)
    end

    it 'should render status 200 - authorized' do
      member = create(:member)
      customer = create(:customer)
      sign_in member
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it 'should render show template' do
      member = create(:member)
      customer = create(:customer)
      sign_in member
      get :show, params: { id: customer.id }
      expect(response).to render_template(:show)
    end
  end
end
