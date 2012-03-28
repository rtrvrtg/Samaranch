class VenueMapsController < ApplicationController

  before_filter :authenticate, :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  caches_page [:index, :show]

  # GET /venue_maps
  # GET /venue_maps.xml
  def index
    @venue_maps = VenueMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venue_maps }
      format.json { render :json => @venue_maps.to_json }
    end
  end

  # GET /venue_maps/1
  # GET /venue_maps/1.xml
  def show
    @venue_map = VenueMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue_map }
      format.json { render :json => {
      	:venue_map => @venue_map.as_json,
      	:locations => @venue_map.locations.as_json,
      	:markers => Marker.all.as_json
      }}
    end
  end

  # GET /venue_maps/new
  # GET /venue_maps/new.xml
  def new
    @venue_map = VenueMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue_map }
    end
  end

  # GET /venue_maps/1/edit
  def edit
    @venue_map = VenueMap.find(params[:id])
  end

  # POST /venue_maps
  # POST /venue_maps.xml
  def create
    @venue_map = VenueMap.create(params[:venue_map])

    respond_to do |format|
      if @venue_map.save
      	expire_page :action => :index
      	
        format.html { redirect_to(@venue_map, :notice => 'Venue map was successfully created.') }
        format.xml  { render :xml => @venue_map, :status => :created, :location => @venue_map }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue_map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venue_maps/1
  # PUT /venue_maps/1.xml
  def update
    @venue_map = VenueMap.find(params[:id])

    respond_to do |format|
      if @venue_map.update_attributes(params[:venue_map])
      	expire_page :action => :index
	    expire_page :action => :show, :id => params[:id]
	    
        format.html { redirect_to(@venue_map, :notice => 'Venue map was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue_map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_maps/1
  # DELETE /venue_maps/1.xml
  def destroy
    @venue_map = VenueMap.find(params[:id])
    @venue_map.destroy
    
    expire_page :action => :index
    expire_page :action => :show, :id => params[:id]

    respond_to do |format|
      format.html { redirect_to(venue_maps_url) }
      format.xml  { head :ok }
    end
  end
end
