class Marker < ActiveRecord::Base
	has_many :locations
	has_attached_file :marker_image, 
	:styles => { 
		:marker => "48x48>", 
		:thumb => "100x100>", 
		:smallthumb => '24x24>' 
	},
	:path_root => Rails.application.config.storage_root,
	:path => Rails.application.config.storage_root + '/:class/:style/:id/:filename',
	:url => Rails.application.config.storage_root_url + '/:class/:style/:id/:filename',
	:url_root => Rails.application.config.storage_root_url,
	:storage => 'sftp',
	:sftp_host => Rails.application.config.storage_host,
	:sftp_user => Rails.application.config.storage_user,
	:sftp_password => Rails.application.config.storage_pass
end
