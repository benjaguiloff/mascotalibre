# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      get '/'
      expect(response).to render_template("/")
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'renders new template' do
      get '/'
      expect(response).to render_template("/")
    end
  end
end
