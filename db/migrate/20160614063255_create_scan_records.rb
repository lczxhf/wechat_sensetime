class CreateScanRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :scan_records do |t|
    	t.references :shop
    	t.references :img_medium
    	t.references :user
    	t.string :image_path
    	t.string :randCode
    	t.string :pic_url
    	t.boolean :del, default: false
      t.timestamps
    end
  end
end
