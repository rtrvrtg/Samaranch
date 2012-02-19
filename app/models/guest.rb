class Guest < ActiveRecord::Base
	has_and_belongs_to_many :sessions
	has_attached_file :photo, :styles => { :medium => "400x400>", :thumb => "100x100>" }
end
