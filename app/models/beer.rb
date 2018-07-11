class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts

  validates :name, { presence: true, uniqueness: true }
  validates :brewery, { presence: true }
  validates :style, presence: true

  @@styles = ['Pilsner', 'IPA', '2xIPA', 'Amber Ale', 'Blonde']

  def self.styles
    @@styles
  end

  @@situations = ["BBQ", "Snow Day", "Working Late", ""]

  def self.situations
    @@situations
  end

end
