class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
