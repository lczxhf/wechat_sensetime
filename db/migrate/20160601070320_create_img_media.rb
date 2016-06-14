class CreateImgMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :img_media do |t|
    	t.references :gzh_config
    	t.string :media_id #
    	t.string :title
    	t.string :introduction
    	t.string :url
    	t.string :local_url
    	t.boolean :del, default: false
      t.timestamps
    end
  end
end
