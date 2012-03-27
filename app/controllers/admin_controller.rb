class AdminController < ApplicationController
  
  before_filter :authenticate, :only => [:index]
  caches_page :index
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render }
    end
  end
  
end
