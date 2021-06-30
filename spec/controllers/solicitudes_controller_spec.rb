# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SolicitudesController, type: :controller do
  describe 'GET show' do
    let(:solicitude) { create(:solicitude) }

    it 'assigns the requested order as @order' do
      get :show, params: { id: solicitude.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'review #update' do
    let!(:solicitude) { create(:solicitude) }

    it 'updates' do
      params = { content: 'update' }
      put :update, params: { id: solicitude.id, solicitude: params }
      solicitude.reload
      expect(solicitude.content).to eq(params[:content])
    end
  end

  describe 'review #delete' do
    let!(:solicitude) { create(:solicitude) }

    it 'delete a solicitude' do
      delete :delete, params: { id: solicitude.id }
      expect(flash[:notice]).to eq('Solicitud eliminada')
    end
  end
end
