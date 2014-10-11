require 'rails_helper'

describe Favorite do

  it "is invalid without a user" do
    favorite = Favorite.new(user_id: nil)
    favorite.valid?
    expect(favorite.errors[:user]).to include("can't be blank")
  end
  it "is invalid without a spot" do
    favorite = Favorite.new(spot_id: nil)
    favorite.valid?
    expect(favorite.errors[:spot]).to include("can't be blank")
  end
  it "is valid with a user and a spot" do
    test_user = FactoryGirl.create(:user)
    test_spot = FactoryGirl.create(:spot)
    expect(Favorite.new(user_id: test_user.id, spot_id: test_spot.id)).to be_valid
  end

end