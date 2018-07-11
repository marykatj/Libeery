class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  belongs_to :beer
  has_many :post_categories
  has_many :categories, through: :post_categories

  has_one_attached :image_file

  validates :description, length: { maximum: 300 }


    def image_url

      unless self.image_file_attachment.nil?
        rails_blob_path(self.image_file, disposition: "attachment", only_path: true)
      end
    end


  @@situations = ['BBQ', 'At the Beach', "Snow Day", "The Game is on", "Beer Session", "With a Meal", "Breakfast Beer", "Day Drinking", "Lunch Time", "Share with Friends", "Beer Hall", "Brewery Tasting Room", "Going Out", "Movie Night"].sort

  def self.situations
    @@situations
  end

end
