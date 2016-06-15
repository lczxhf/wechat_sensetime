class ScanRecord < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	belongs_to :img_medium
	acts_as_cached(version:1,expires_in:1.week)
end
