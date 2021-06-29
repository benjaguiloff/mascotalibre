require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  
    describe "GET show" do
        let(:review) { create(:review) }
        it "assigns the requested order as @order" do
          get :show, params: { id: review.id }
          expect(response).to have_http_status(200)
        end
        it "assigns the requested order as @order" do
            get :show, params: { id: review.id }
            expect(response).to render_template(:show)
          end
    end

    describe "review #create" do
        let!(:params) { 
            {content: "sabe"}
        }
        it "create a new review" do
            post :create, params: { review: params }
            expect(flash[:notice]).to eq('Reseña creada correctamente')
        end
        it "create a new review" do
            post :create, params: { review: params }
            expect(response).to redirect_to(action: :index)
        end
    end

    describe "review #update" do
        let!(:review) { create(:review) }
        it "should update" do
            params = { content: "update" }
            put :update, params: { id: review.id, review: params }
            review.reload 
            expect(review.content).to eq(params[:content])

        end 
    end

    describe "review #edit" do
        let(:review) { create(:review) }
        it "should update" do
            get :edit, params: { id: review.id }
            expect(response).to render_template(:edit)

        end 
    end

    describe "review #delete" do
        let!(:review) { create(:review) }
            
        it "delete a post" do
            delete :delete, params: { id: review.id }
            expect(flash[:notice]).to eq('Reseña eliminada')
        end
        
    end
end