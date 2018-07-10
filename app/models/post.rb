class Post < ApplicationRecord
  belongs_to :user
  belongs_to :beer   #accepts nested attributes for ...


  validates :description, length: { maximum: 300 }

  accepts_nested_attributes_for :beer

end
