class AuthController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:login, :do_login, :logout]
  
  def index
    login
    render('login')
  end
  
  def login
  end
  
  def do_login
    authorised_user = User.authenticate(params[:username], params[:password])
    if authorised_user
      session[:user_id] = authorised_user.id
      session[:username] = authorised_user.username
      @user = authorised_user
      flash[:notice] = "You are now logged in as #{authorised_user.username}"
      redirect_to(:controller => 'users', :action => 'show', :id => authorised_user.id)
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')      
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have successfully logged out of the application"
    redirect_to(login_path)
  end
end
