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
    user = User.first
    spot = Spot.first
    favorite = Favorite.new(user: user, spot: spot)
    expect(favorite).to be_valid
  end

end