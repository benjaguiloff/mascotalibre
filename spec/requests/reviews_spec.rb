require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/reviews/index"
      expect(response).to have_http_status(:success)
    end

    it "should render index view" do
      get "/reviews/index"
      expect(response).to render_template(:index)
    end
  end


  describe "GET /new" do
    it "returns http success" do
      get "/reviews/new"
      expect(response).to have_http_status(:success)
    end

    it "should render new template" do
      get "/reviews/new"
      expect(response).to render_template(:new)
    end
  end


end
