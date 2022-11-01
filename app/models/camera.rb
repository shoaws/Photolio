class Camera < ApplicationRecord
  has_many :photo_cameras, dependent: :destroy
  has_many :photos, through: :photo_cameras

  validates :name, uniqueness: true
end
