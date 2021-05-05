require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/messages/index"
      expect(response).to have_http_status(:success)
    end

    it "should render index view" do 
      get "/messages/index"
      expect(response).to render_template(:index)
    end 
  end
end
