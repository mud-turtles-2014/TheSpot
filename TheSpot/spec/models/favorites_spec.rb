require 'rails_helper'

describe Favorite do

  it "is invalid without a user" do
    favorite = Favorite.new(user_id: nil)
    favorite.valid?
    expect(favorite.errors[:user]).to include("can't be blank")
  end
  it "is invalid without a spot"
  it "is valid with a user and a spot"

end