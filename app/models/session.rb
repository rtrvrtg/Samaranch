class Session < ActiveRecord::Base
	belongs_to :location
	belongs_to :session_type
	has_and_belongs_to_many :guests
end
