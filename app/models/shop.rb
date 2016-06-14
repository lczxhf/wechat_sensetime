class Shop < ApplicationRecord
	has_many :gzh_configs
	has_many :gzh_infos
	has_many :users
	has_many :scan_records
	enum status: [:probation,:normal,:expire]

	def can_authorize?
		!self.expire?
	end
end
