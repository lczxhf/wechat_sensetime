class Member < ApplicationRecord
	belongs_to :user
	belongs_to :shop

	mount_uploader :image_path,MediaUploader
end
