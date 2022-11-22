class Photo < ApplicationRecord

  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :favorited_members, through: :favorites, source: :member
  has_many :photo_comments, dependent: :destroy
  has_many :photo_tags,dependent: :destroy
  has_many :tags,through: :photo_tags
  has_many :photo_cameras, dependent: :destroy
  has_many :cameras, through: :photo_cameras

  has_one_attached :image

  # 緯度、経度の取得
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :image, presence: true
  validates :body, length: {maximum: 40}
  validates :address, length: {maximum: 10}

  # いいねしているかどうか
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  # 写真検索
  def self.search(keyword)
    where(["body like? OR address like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在存在するタグから送られてきたタグを除いてold_tagsに代入
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnew_tagsに代入
    new_tags = sent_tags - current_tags
    # 古いタグを消す
    old_tags.each do |old_tag|
      self.tags.delete　Tag.find_by(name: old_tag)
    end
    # 新しいタグを保存
    new_tags.each do |new_tag|
      new_photo_tag = Tag.find_or_create_by(name: new_tag)
      self.tags << new_photo_tag
    end
  end

  def save_camera(sent_cameras)
    current_cameras = self.cameras.pluck(:name) unless self.cameras.nil?
    old_cameras = current_cameras - sent_cameras
    new_cameras = sent_cameras - current_cameras

    old_cameras.each do |old_camera|
      self.old_cameras.delete　Camera.find_by(name: old_camera)
    end

    new_cameras.each do |new_camera|
      new_photo_camera = Camera.find_or_create_by(name: new_camera)
      unless self.cameras.include?(new_photo_camera)
        self.cameras << new_photo_camera
      end
    end

  end


end
