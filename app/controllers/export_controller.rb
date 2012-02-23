class ExportController < ApplicationController
  
  def index
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
