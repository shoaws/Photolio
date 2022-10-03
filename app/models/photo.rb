class Photo < ApplicationRecord
  
  has_one_attached :photo_image
end
