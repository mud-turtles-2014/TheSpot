require 'rails_helper'

describe CommentsController do

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new comment in the database" do
        expect{ post :create, spot_id: 1, comment: FactoryGirl.create(:comment)}.to change(Comment, :count).by(1)
      end
    end
  end
end
