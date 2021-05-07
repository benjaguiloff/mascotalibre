require 'rails_helper'

RSpec.describe "Solicitudes", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/solicitudes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/solicitudes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/solicitudes/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/solicitudes/index"
      expect(response).to have_http_status(:success)
    end
  end

end
