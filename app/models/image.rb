class Image < ApplicationRecord
  belongs_to :blog
  mount_uploader :image, AvatarUploader
end
