class SponsorTypesController < ApplicationController
  # GET /sponsor_types
  # GET /sponsor_types.xml
  def index
    @sponsor_types = SponsorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sponsor_types }
    end
  end

  # GET /sponsor_types/1
  # GET /sponsor_types/1.xml
  def show
    @sponsor_type = SponsorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sponsor_type }
    end
  end

  # GET /sponsor_types/new
  # GET /sponsor_types/new.xml
  def new
    @sponsor_type = SponsorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sponsor_type }
    end
  end

  # GET /sponsor_types/1/edit
  def edit
    @sponsor_type = SponsorType.find(params[:id])
  end

  # POST /sponsor_types
  # POST /sponsor_types.xml
  def create
    @sponsor_type = SponsorType.new(params[:sponsor_type])

    respond_to do |format|
      if @sponsor_type.save
        format.html { redirect_to(@sponsor_type, :notice => 'Sponsor type was successfully created.') }
        format.xml  { render :xml => @sponsor_type, :status => :created, :location => @sponsor_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sponsor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sponsor_types/1
  # PUT /sponsor_types/1.xml
  def update
    @sponsor_type = SponsorType.find(params[:id])

    respond_to do |format|
      if @sponsor_type.update_attributes(params[:sponsor_type])
        format.html { redirect_to(@sponsor_type, :notice => 'Sponsor type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sponsor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsor_types/1
  # DELETE /sponsor_types/1.xml
  def destroy
    @sponsor_type = SponsorType.find(params[:id])
    @sponsor_type.destroy

    respond_to do |format|
      format.html { redirect_to(sponsor_types_url) }
      format.xml  { head :ok }
    end
  end
end
