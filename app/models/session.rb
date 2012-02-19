class Session < ActiveRecord::Base
	belongs_to :location
	has_and_belongs_to_many :guests
end
