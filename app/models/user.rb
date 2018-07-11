class User < ApplicationRecord

  has_many :posts
  has_many :beers, through: :posts

  validates :name, { presence: true, uniqueness: true }
  validates :name, length: { maximum: 12 }
  validates :location, presence: true

  has_secure_password
end
