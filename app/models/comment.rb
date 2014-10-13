class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot
  has_many :votes
  validates :user, :spot, :body, presence: true
  
  def user_can_edit(user)
    if self.user
      return user == self.user
    else
      return false
    end
  end

  def addVote
    self.upvotes += 1
    self.save
  end

end
