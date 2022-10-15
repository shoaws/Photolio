class PhotoComment < ApplicationRecord
  belongs_to :photo
  belongs_to :member
  
  validates :comment, presence: true, length: {maximum: 30}
end
