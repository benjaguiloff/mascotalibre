require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/welcome/index"
      expect(response).to have_http_status(:success)
    end

    it "should render index view" do 
      get "/welcome/index"
      expect(response).to render_template(:index)
    end 
  end

end
