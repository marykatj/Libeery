class Post < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  has_many :post_categories
  has_many :categories, through: :post_categories

  has_one_attached :image_file


  validates :description, length: { maximum: 300 }


  @@situations = ['BBQ', 'At the Beach', "It's hot as hell out here!"]

  def self.situations
    @@situations
  end

end
