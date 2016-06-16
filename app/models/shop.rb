class Shop < ApplicationRecord
	has_one :gzh_config
	has_one :gzh_info
	has_many :users
	has_many :scan_records
	enum status: [:probation,:normal,:expire]
	acts_as_cached(version:1,expires_in:1.week)

	def can_authorize?
		!self.expire?
	end
end
