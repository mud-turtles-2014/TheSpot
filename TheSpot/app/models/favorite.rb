class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot, counter_cache: true
  validates :user, uniqueness: true, presence: true
  validates :spot, presence: true
end