class SponsorType < ActiveRecord::Base
  # validates_format_of :url, :on => :create
  has_many :sponsors
end
