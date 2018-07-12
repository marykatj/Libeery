class User < ApplicationRecord

  has_many :posts
  has_many :beers, through: :posts
  has_many :favorites
  has_many :beers, through: :favorites

  validates :name, { presence: true, uniqueness: true }
  validates :name, length: { maximum: 12 }
  validates :location, presence: true

  has_secure_password
end
