class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts

  validates :name, { presence: true, uniqueness: true }
  validates :brewery, { presence: true }
  validates :style, presence: true
  validates :abv, presence: true

  accepts_nested_attributes_for :posts

  @@styles = ['Pilsner', 'IPA', '2xIPA', 'Amber Ale', 'Blonde']

  def self.styles
    @@styles
  end

  def self.find_by_name(search_term)
    Beer.all.select {|b| b.name.downcase.include?(search_term.downcase)}
  end

  # def fetch_posts
  #   Post.all.select do |post|
  #     post.beer.name == self.name
  #   end
  # end
  def fetch_posts
    Post.where("beer_id = ?", self.id)
  end

  def fetch_categories
    categories = []
    fetch_posts.each {|post| categories.concat(post.categories)}
    categories.uniq
  end

end
