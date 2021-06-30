# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      get '/users/index'
      expect(response).to render_template(:index)
    end
  end
end

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    context 'when initialized' do
      subject(:user) { User.new }

      it 'is a new widget' do
        expect(user).to be_a_new(User)
      end
    end
  end
end

# RSpec.describe TeamsController do
# describe "GET index" do
# it "assigns @teams" do
#  team = Team.create
# get :index
# expect(assigns(:teams)).to eq([team])
# end

# it "renders the index template" do
# get :index
# expect(response).to render_template("index")
# end
# end
# end
