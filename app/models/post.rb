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


  @@situations = ['BBQ', 'At the Beach', "It's hot as hell out here!"]

  def self.situations
    @@situations
  end

end
