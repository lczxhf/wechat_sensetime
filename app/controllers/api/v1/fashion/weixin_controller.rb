class Api::V1::Fashion::WeixinController < Api::V1::ApplicationController
    def upload
	param! :randCode, String, required: true
	param! :shop_id, Integerm required: true
	check_file :upload, max_size:1024, file_type: ['jpg','jpeg']
	
	record = ScanRecord.create(shop_id:params[:shop_id],image_path:params[:upload],randCode:params[:randCode])
 	UploadImgToWechatJob.perform_later(a.id)	
	
    end
end
