class UsersController < ApplicationController
  def index
  end

  def list
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.username} created successfully. You may now login."
      redirect_to(:controller => 'auth', :action => 'login')
    else
      render('new')
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User #{@user.username} updated."
      redirect_to(:action => 'edit')
    else
      puts @user.errors.inspect
      render("edit")
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end
end
