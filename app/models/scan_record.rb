class ScanRecord < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	belongs_to :img_medium
	acts_as_cached(version:1,expires_in:1.week)

	mount_uploader :image_path, MediaUploader

	def upload_media
	    file = File.new(Rails.root.to_path+"/public"+self.image_path.url)
	    gzh_config = self.shop.gzh_config
	    if gzh_config
	    	result = JSON.parse(Wechat.upload_media(gzh_config.token,file,"image",self.image_path.filename))
	    	self.media_id = result['media_id'] and self.save if result['media_id'].present?
	    	file.close
	    end
	end
end
