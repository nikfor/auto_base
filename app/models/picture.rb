class Picture < ActiveRecord::Base
  belongs_to :car
  mount_uploader :image,  AvatarUploader
end
