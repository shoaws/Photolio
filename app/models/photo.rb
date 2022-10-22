class Photo < ApplicationRecord

  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :favorited_members, through: :favorites, source: :member
  has_many :photo_comments, dependent: :destroy

  has_one_attached :image

  # 緯度、経度の取得
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :image, presence: true
  validates :body, length: {maximum: 50}
  validates :address, length: {maximum: 10}

  # いいねしているかどうか
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  # 写真検索
  def self.search(keyword)
    where(["body like? OR address like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
