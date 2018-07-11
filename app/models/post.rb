class Post < ApplicationRecord
  belongs_to :user
  belongs_to :beer   #accepts nested attributes for ...


  validates :description, length: { maximum: 300 }

  

end
