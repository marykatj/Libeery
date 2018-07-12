class Beer < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, { presence: true, uniqueness: true }
  validates :brewery, { presence: true }
  validates :style, presence: true
  validates :abv, presence: true
  validates :abv, length: { maximum: 3 }

  accepts_nested_attributes_for :posts

  # @@styles = ['Pilsner', 'IPA', 'Double IPA', 'Triple IPA', 'Amber Ale', 'Blonde', 'Brown Ale', 'Pale Ale', 'Lager', 'Belgian', 'Red IPA', 'Red Ale', 'Stout', 'Poter', 'Imperial Stout', 'Wheat', 'Hefeweizen', 'Saison', 'Farmhouse', 'Milk Stout', 'English Bitter', 'Dunkel', 'Dopplebock', 'Kolsch', 'Oktoberfest', 'Helles', 'Pumpkin Beer', 'NE IPA', 'Rye', 'Double Dry Hopped', 'Session IPA', "Pale Lager", 'IPL', 'Vienna Style'].sort

  # def self.styles
  #   @@styles
  # end

  @@styles = self.all.map {|beer| beer.style}.uniq.sort

  def self.styles
    @@styles
  end

  def self.find_by_name_or_brewery(search_term)
    Beer.all.select do |b|
      "#{b.name} #{b.brewery}".downcase.include?(search_term.downcase)
    end
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
