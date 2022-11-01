class Camera < ApplicationRecord
  has_many :post_cameras, dependent: :destroy
  has_many :photos, through: :post_cameras

  validates :name, uniqueness: true
end
