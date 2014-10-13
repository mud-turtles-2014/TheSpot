
class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites

  def is_favorited_by(user)
  	self.favorites.include?(user.favorite)
  end
end
