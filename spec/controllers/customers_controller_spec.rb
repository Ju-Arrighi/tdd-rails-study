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
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it "status 302 - not authorized" do
      # customer = create(:customer)
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(302)
      # puts customer.id
    end

    it 'should render status 200 - authorized' do
      # member = create(:member)
      # customer = create(:customer)
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'should render show template' do
      # member = create(:member)
      # customer = create(:customer)
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end

    it 'should login valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'verifies flash notice' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(//)
      p response.inspect
    end

     it 'content-type' do
      # customer_params = attributes_for(:customer)
      sign_in @member
      get :show, format: :json, params: { id: @customer.id }
      expect(response.content_type).to have_content('application/json')
    end
  end
end
