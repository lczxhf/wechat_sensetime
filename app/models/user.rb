class User < ApplicationRecord
	belongs_to :shop
	belongs_to :sangna_config
	acts_as_cached(version:1,expires_in:3.hours)
end
