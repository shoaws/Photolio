class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
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
end
