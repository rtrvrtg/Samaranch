class VenueMap < ActiveRecord::Base
	belongs_to :venue
	has_many :locations
	has_attached_file :map_image, 
	:styles => { 
		:full_size => "800x800>", 
		:thumb => "100x100>" },
	:path_root => Rails.application.config.storage_root,
	:path => Rails.application.config.storage_root + '/:class/:style/:id/:filename',
	:url => Rails.application.config.storage_root_url + '/:class/:style/:id/:filename',
	:url_root => Rails.application.config.storage_root_url,
	:storage => 'sftp',
	:sftp_host => Rails.application.config.storage_host,
	:sftp_user => Rails.application.config.storage_user,
	:sftp_password => Rails.application.config.storage_pass
end
