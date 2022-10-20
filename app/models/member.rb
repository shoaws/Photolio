class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_photos, through: :favorites, source: :photo
  has_many :photo_comments, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true, length: {maximum: 10}
  validates :introduction, length: {maximum: 30}
  validates :phone_number, presence: true

  # アイコン表示
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image
  end

  #ゲストメンバー作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.last_name = "guest"
      member.first_name = "member"
      member.nickname = "ゲストさん"
      member.phone_number ="guestnumber"
    end
  end


  # フォローの処理
  def follow(member_id)
    relationships.create(followed_id: member_id)
  end
  # フォローを外す処理
  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end
  # フォローしているかどうか
  def following?(member)
    followings.include?(member)
  end

  # メンバー検索
  def self.search(member_keyword)
    where(["nickname like?", "%#{member_keyword}%"])
  end

  def self.admin_search(member_keyword)
    where(["last_name like? OR first_name like? OR nickname like? OR phone_number like? OR email like?", "%#{member_keyword}%", "%#{member_keyword}%", "%#{member_keyword}%", "%#{member_keyword}%", "%#{member_keyword}%"])
  end
end
