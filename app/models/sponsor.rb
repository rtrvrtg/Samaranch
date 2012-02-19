class Sponsor < ActiveRecord::Base
	belongs_to :location
	has_attached_file :logo, :styles => { :medium => "400x400>", :thumb => "100x100>" }
end
