require 'rails_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:spot) { FactoryGirl.create(:spot) }
  let(:body) { "Best cookies ever!" }

  it "is invalid without a user" do
    expect(Comment.create(spot: spot, body: body)).to_not be_valid
  end
  it "is invalid without a spot" do
    expect(Comment.create(user: user, body: body)).to_not be_valid
  end
  it "is invalid without a body" do
    comment = Comment.new(user: user, spot: spot)
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end
  it "is valid with a user" do
    expect(Comment.create(user: user, spot: spot, body: body)).to be_valid
  end
end


