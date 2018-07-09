class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  belongs_to :brewery

  validates :name, { presence: true, uniqueness: true }
  validates :style, presence: true

  @@styles = []

  def self.styles
    @@styles
  end

  @@situations = []

  def self.situations
    @@situations
  end

end
