class AdminController < ApplicationController
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render }
    end
  end
  
end
