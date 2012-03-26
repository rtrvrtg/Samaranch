class Marker < ActiveRecord::Base
	has_many :locations
	has_attached_file :marker_image, 
	:styles => { 
		:marker => "48x48>", 
		:thumb => "100x100>", 
		:smallthumb => '24x24>' 
	},
	:path => Rails.application.config.storage_root + 'm/',
	:storage => 'sftp',
	:sftp_host => Rails.application.config.storage_host,
	:sftp_user => Rails.application.config.storage_user,
	:sftp_password => Rails.application.config.storage_pass
end
