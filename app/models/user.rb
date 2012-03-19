class User < ActiveRecord::Base
  acts_as_authentic
 
  validates_presence_of :login, :email, :first_name
  validates_uniqueness_of :login, :email
  
  def name
    "#{self.first_name} #{self.last_name}".strip
  end
 
  # Import user from Basecamp
  def self.import(h)
    u = User.new(
      :login => h['user_name'],
      :email => h['email_address'],
      :password => h['password'],
      :password_confirmation => h['password'],
      :first_name => h['first_name'],
      :last_name => h['last_name']
    )
    u.save
    u
  end
end
