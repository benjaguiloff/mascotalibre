# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'GET show' do
    let(:comment) { create(:comment) }

    it 'assigns the requested order as @order' do
      get :show, params: { id: comment.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the requested as @order' do
      get :show, params: { id: comment.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'comment #update' do
    let!(:comment) { create(:comment) }

    it 'updates' do
      params = { contents: 'update' }
      put :update, params: { id: comment.id, comment: params }
      comment.reload
      expect(comment.contents).to eq(params[:contents])
    end
  end

  describe 'comment #edit' do
    let(:comment) { create(:comment) }

    it 'updates' do
      get :edit, params: { id: comment.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'comment #delete' do
    let!(:comment) { create(:comment) }

    it 'delete a post' do
      delete :delete, params: { id: comment.id }
      expect(flash[:notice]).to eq('El comentario ha sido eliminada')
    end
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
