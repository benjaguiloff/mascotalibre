require 'rails_helper'

RSpec.describe User do
    it "returns email" do
        user = build(:user)
        expect(user.email).to eq 'sabe@sabe.cl'
    end

   
end