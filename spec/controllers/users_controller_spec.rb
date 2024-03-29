# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET show' do
    let(:user) { create(:user) }

    it 'assigns the requested order as @order' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the requested as @order' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
