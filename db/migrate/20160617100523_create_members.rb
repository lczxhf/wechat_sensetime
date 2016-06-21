class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
	t.references :user
	t.references :shop

	t.integer :api_user_id
	t.string :name
	t.string :image_path
	t.boolean :del, default: false
      	t.timestamps
    end
  end
end
