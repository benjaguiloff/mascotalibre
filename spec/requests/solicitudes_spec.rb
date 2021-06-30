# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Solicitudes', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/solicitudes/new'
      expect(response).to have_http_status(:success)
    end

    it 'renders new template' do
      get '/solicitudes/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/solicitudes/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      get '/solicitudes/index'
      expect(response).to render_template(:index)
    end
  end
end
