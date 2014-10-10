class User < ActiveRecord::Base
  has_one :favorite
  has_many :spots
  has_many :comments
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "must be valid email" }
end