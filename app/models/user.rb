class User < ApplicationRecord
  has_secure_password
  has_many :messages
  validates :username, presence: true, length: {minimum: 3, maximum: 30}
  validates_uniqueness_of :username
end
