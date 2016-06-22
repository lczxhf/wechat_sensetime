class RemoveReferenceImgMediumFromScanRecord < ActiveRecord::Migration[5.0]
  def change
	remove_reference :scan_records, :img_medium
	add_column :scan_records, :media_id, :string
  end
end
