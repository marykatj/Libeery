class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  belongs_to :brewery

  validates :name, { presence: true, uniqueness: true }
  validates :style, presence: true
end
