class Photo < ApplicationRecord

  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy

  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
