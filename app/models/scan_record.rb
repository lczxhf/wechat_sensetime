class ScanRecord < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	belongs_to :img_medium
end
