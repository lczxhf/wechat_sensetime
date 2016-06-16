class User < ApplicationRecord
	belongs_to :shop
	belongs_to :gzh_config
	has_many :scan_records	
	acts_as_cached(version:1,expires_in:3.hours)
end
