class PosterImage < ActiveRecord::Base
  # attr_accessible :gallery_id, :name, :image, :remote_image_url


   # attr_accessible :gallery_id, :name, :image, :remote_image_url

    # attr_accessible :movie_id,:remote_image_url
  belongs_to :movie
  mount_uploader :image, ImageUploader
end
