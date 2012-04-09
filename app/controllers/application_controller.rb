class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :prefs
  
  def prefs
  	pref_list = {
  		:image_url_base => Rails.application.config.storage_root_url
  	}
  	pref_list.to_json
  end
  
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        host = Rails.application.config.basecamp_name + '.basecamphq.com'
        begin
          Basecamp.establish_connection! host, username, password, true
          token = Basecamp::Person.me.token
          token.nil? == false
        end
      end
    end
end
