class ScanRecord < ApplicationRecord
	belongs_to :user
	belongs_to :shop
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

	def get_qrcode
	    gzh_config = self.shop.gzh_config
	    if gzh_config
	      result = JSON.parse(Wechat.get_qrcode(gzh_config.token,"QR_SCENE",7200,self.id))
	      if result['ticket']
		 result['url']
	      end
	    end
	end

	def get_media_id
	   if Time.now - record.updated_at > Settings.tmp_media_expire_time 	
		self.upload_media
	   end
	   self.media_id
	end
end
