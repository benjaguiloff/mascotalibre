require 'rails_helper'

RSpec.describe SolicitudesController, type: :controller do
  
    describe "solicitude #delete" do
        let!(:params) {{content: "sa", user_id: 1, publication_id: 2}}
        it "delete a solicitude" do
            post :create, params: { solicitude: params } 
            delete :delete, params: { id: solicitude.id }
            expect(flash[:notice]).to eq('Solicitud eliminada')
        end   
    end
end

