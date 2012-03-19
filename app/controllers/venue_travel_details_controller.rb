class VenueTravelDetailsController < ApplicationController

  before_filter :authenticate, :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /venue_travel_details
  # GET /venue_travel_details.xml
  def index
    @venue_travel_details = VenueTravelDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venue_travel_details }
    end
  end

  # GET /venue_travel_details/1
  # GET /venue_travel_details/1.xml
  def show
    @venue_travel_detail = VenueTravelDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue_travel_detail }
    end
  end

  # GET /venue_travel_details/new
  # GET /venue_travel_details/new.xml
  def new
    @venue_travel_detail = VenueTravelDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue_travel_detail }
    end
  end

  # GET /venue_travel_details/1/edit
  def edit
    @venue_travel_detail = VenueTravelDetail.find(params[:id])
  end

  # POST /venue_travel_details
  # POST /venue_travel_details.xml
  def create
    @venue_travel_detail = VenueTravelDetail.new(params[:venue_travel_detail])

    respond_to do |format|
      if @venue_travel_detail.save
        format.html { redirect_to(@venue_travel_detail, :notice => 'Venue travel detail was successfully created.') }
        format.xml  { render :xml => @venue_travel_detail, :status => :created, :location => @venue_travel_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue_travel_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venue_travel_details/1
  # PUT /venue_travel_details/1.xml
  def update
    @venue_travel_detail = VenueTravelDetail.find(params[:id])

    respond_to do |format|
      if @venue_travel_detail.update_attributes(params[:venue_travel_detail])
        format.html { redirect_to(@venue_travel_detail, :notice => 'Venue travel detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue_travel_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_travel_details/1
  # DELETE /venue_travel_details/1.xml
  def destroy
    @venue_travel_detail = VenueTravelDetail.find(params[:id])
    @venue_travel_detail.destroy

    respond_to do |format|
      format.html { redirect_to(venue_travel_details_url) }
      format.xml  { head :ok }
    end
  end
end
