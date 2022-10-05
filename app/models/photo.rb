class Photo < ApplicationRecord
  
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy
  
  has_one_attached :image
  
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  
end
