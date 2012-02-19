class Location < ActiveRecord::Base
	belongs_to :venue_map
	has_many :sessions
	has_many :sponsors
	belongs_to :marker
	# has_attached_file :marker, :styles => { :marker => "48x48>", :thumb => "100x100>" }
end
