class Venue < ActiveRecord::Base
	has_many :venue_travel_details
	has_many :venue_maps
end
