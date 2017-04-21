class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  mount_uploader :image, AvatarUploader
  mount_uploader :video, AvatarUploader
end