module Basecamp  
  @@config = {}
 
  class WrongCredentials < Exception ; end
  class WrongUserType < Exception ; end
 
  # Configure Basecamp account
  # account should be a subdomain of your url
  def self.configure(account)
    @@config[:subdomain] = account
  end
 
  # Authenticate user
  # Options:
  #   :client => true|false - Check if client of the company
  def self.authenticate(user, password, opts={})
    url = "https://#{@@config[:subdomain]}.basecamphq.com/me.xml"
    res = RestClient::Resource.new(url, :user => user, :password => password)
    begin
      person = Hash.from_xml(res.get)['person']
      if opts.key?(:client) && opts[:client]
        raise WrongUserType, 'Invalid user type!' if person['client_id'] == 0
      end
      person
    rescue RestClient::Unauthorized
      raise WrongCredentials, 'Invalid username or password'
    end
  end
end