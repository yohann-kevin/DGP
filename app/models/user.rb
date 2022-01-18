class User < ApplicationRecord
  validates :pseudo, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
