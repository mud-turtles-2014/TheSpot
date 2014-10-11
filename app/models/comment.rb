class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot
  validates :user, :spot, :body, presence: true
end
