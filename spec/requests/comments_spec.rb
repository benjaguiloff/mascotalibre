# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/comments/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      get '/comments/index'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/comments/new'
      expect(response).to have_http_status(:success)
    end

    it 'renders new view' do
      get '/comments/new'
      expect(response).to render_template(:new)
    end
  end
end
