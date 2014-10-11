require 'rails_helper'

describe FavoritesController do
  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new favorite in the database" do
        expect{ post :create, favorite: attributes_for(:favorite)}.to change(Favorite, :count).by(1)
      end
      it "redirects to spot#show" do
      end
    end

    context "with invalid attributes" do
      it "does not save the new favorite in the database" do
      end
      it "re-renders the spot#show page" do
      end
    end
  end
end
