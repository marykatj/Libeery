class Post < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  has_one_attached :image_file  


  validates :description, length: { maximum: 300 }

  accepts_nested_attributes_for :beer

end
