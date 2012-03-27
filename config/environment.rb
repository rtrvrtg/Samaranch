# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Locationmgr::Application.initialize!

# Rails.logger = Logger.new(STDOUT)
Rails.logger = dev_null

Locationmgr::Application.configure do
end
