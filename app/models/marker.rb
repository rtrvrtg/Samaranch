class Marker < ActiveRecord::Base
	has_many :locations
	has_attached_file :marker_image, :styles => { :marker => "48x48>", :thumb => "100x100>" }
end
