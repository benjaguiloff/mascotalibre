# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/messages/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      get '/messages/index'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/messages/new'
      expect(response).to have_http_status(:success)
    end

    it 'renders new view' do
      get '/messages/new'
      expect(response).to render_template(:new)
    end
  end
end
