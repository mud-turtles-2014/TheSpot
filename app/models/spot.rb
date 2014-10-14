
class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites

  geocoded_by :address
  after_validation: geocode

  def is_favorited_by(user)
  	self.favorites.include?(user.favorite)
  end
end
