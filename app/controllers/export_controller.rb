class ExportController < ApplicationController
  
  caches_action :index
  
  def index
    
    if request.query_parameters.has_key?('reset') then
      expire_action :action => :index
    end
    
    @guests_sessions = []
    Guest.all.each do |g|
      unless g.nil? or g.sessions.nil?
        g.sessions.each do |s|
          @guests_sessions << {
            :guest_id => g.id,
            :session_id => s.id
          }
        end
      end
    end
    
    respond_to do |format|      
      format.json { render :json => {
        :venues => Venue.all.as_json,
        :venue_maps => VenueMap.all.as_json,
        :venue_travel_details => VenueTravelDetail.all.as_json,
        :markers => Marker.all.as_json,
        :locations => Location.all.as_json,
        :sponsor_types => SponsorType.all.as_json,
        :sponsors => Sponsor.all.as_json,
        :session_types => SessionType.all.as_json,
        :sessions => Session.all.as_json,
        :guests => Guest.all.as_json,
        :guests_sessions => @guests_sessions
      }}
    end
  end
  
end
