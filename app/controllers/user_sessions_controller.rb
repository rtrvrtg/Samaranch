class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def index
    if current_user_session.nil?
      redirect_to new_user_session_url
    else
      redirect_to root_url
    end
  end
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    # @user_session = UserSession.new(params[:user_session])
    
    fields = params[:user_session]
    @user_session = UserSession.new(fields)
    
    Basecamp.configure('smashconventionhq')
 
    user = User.find_by_login(fields[:login])
    if user.nil?
      begin
        me = Basecamp.authenticate(fields[:login], fields[:password], :client => false)
        user = User.import(me.merge('password' => fields[:password]))
      rescue Basecamp::WrongCredentials
        @user_session.errors.add(:base, "Sorry, your username or password wasn't recognized.")
      rescue Basecamp::WrongUserType
        @user.session.errors.add(:base, "Sorry, you're not allowed here.")
      end
    end
 
    if @user_session.save
      return redirect_to root_path
    else
      @user_session.errors.add :base, "Sorry, your username or password wasn't recognized."
    end
 
    render :action => :new
  end
  
  def destroy
    current_user_session.destroy
    # flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end