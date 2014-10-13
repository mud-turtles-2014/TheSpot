class User < ActiveRecord::Base
  has_one :favorite
  has_many :spots
  has_many :comments
  has_many :votes
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "must be valid email" }

  def has_voted_on(comment)
    self.votes.each do |vote|
      if vote.comment_id == comment.id 
      	return true
      end
    end
    false
  end

  def id_for_vote_on(comment)
    self.votes.each do |vote|
      if vote.comment_id == comment.id 
      	return vote.id
      end
    end
    nil
  end

end