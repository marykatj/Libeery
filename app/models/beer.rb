class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  belongs_to :brewery

  validates :name, { presence: true, uniqueness: true }
  validates :style, presence: true

  accepts_nested_attributes_for :brewery

  @@styles = ['Pilsner', 'IPA', '2xIPA', 'Amber Ale', 'Blonde']

  def self.styles
    @@styles
  end

  @@situations = []

  def self.situations
    @@situations
  end

end
