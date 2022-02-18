class User < ApplicationRecord
  validates :email, :name, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

  has_secure_password

  has_many :tasks
end
