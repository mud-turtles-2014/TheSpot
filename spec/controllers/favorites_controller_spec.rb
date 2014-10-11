require 'rails_helper'

describe FavoritesController do
  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new favorite in the database" do
        expect{ post :create, spot_id: 1, favorite: FactoryGirl.create(:favorite)}.to change(Favorite, :count).by(1)
      end
      it "redirects to spot#show" do
        post :create, spot_id: 1, favorite: attributes_for(:favorite)
        expect(response).to redirect_to spots_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new favorite in the database" do
        expect{ post :create, spot_id: 1,favorite: attributes_for(:invalid_favorite)}.to change(Favorite, :count).by(0)
      end
      it "re-renders the spot#show page" do
        post :create, spot_id: 1, favorite: attributes_for(:favorite)
        expect(response).to redirect_to spots_path
      end
    end
  end
end
