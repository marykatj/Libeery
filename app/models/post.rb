class Post < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :description, length: { maximum: 300 }
end
