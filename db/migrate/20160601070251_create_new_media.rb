class CreateNewMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :new_media do |t|
    	t.references :gzh_config
    	t.references :img_medium
    	t.string :title
    	t.string :media_id
    	t.string :thumb_url
    	t.boolean :show_cover_pic,default: false
    	t.string :author
    	t.string :digest
    	t.text :content
    	t.string :url
    	t.string :content_source_url
    	t.boolean :del, default: false
      t.timestamps
    end
  end
end
