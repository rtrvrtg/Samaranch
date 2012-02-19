class VenueMap < ActiveRecord::Base
	belongs_to :venue
	has_many :locations
	has_attached_file :map_image, :styles => { :full_size => "800x800>", :thumb => "100x100>" }
end
