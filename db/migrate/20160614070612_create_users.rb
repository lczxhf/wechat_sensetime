class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.references :shop
    	t.references :sangna_config

    	t.string :openid
    	t.string :nickname
    	t.boolean :sex
    	t.string :city
    	t.string :country
    	t.string :province
    	t.string :language
    	t.string :headimgurl
    	t.integer :subscribe_time

    	t.boolean :del, default: false
      t.timestamps

    end
  end
end
