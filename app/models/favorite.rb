class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates_uniqueness_of :user_id, scope: :beer_id
end
