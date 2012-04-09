class ExportController < ApplicationController
  
  caches_action :index
  
  def index
    
    if request.query_parameters.has_key?('reset') then
      expire_action :action => :index
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
      	:guests => Guest.all.as_json
      }}
    end
  end
  
end
