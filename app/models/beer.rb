class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts

  validates :name, { presence: true, uniqueness: true }
  validates :brewery, { presence: true }
  validates :style, presence: true

  accepts_nested_attributes_for :posts

  @@styles = ['Pilsner', 'IPA', '2xIPA', 'Amber Ale', 'Blonde']

  def self.styles
    @@styles
  end

  @@situations = ['BBQ', 'At the Beach', "It's hot as hell out here!"]

  def self.situations
    @@situations
  end

  def self.find_by_name(search_term)
    Beer.all.select {|b| b.name.downcase.include?(search_term.downcase)}
  end

end
