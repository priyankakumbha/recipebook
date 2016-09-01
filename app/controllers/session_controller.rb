class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by( :email_id => params[:email_id] )

    if user.present? && user.authenticate( params[:password] )
      # flash[:success] = "User successfully logged in"
      session[:user_id] = user.id
      # if user.admin
      # redirect_to users_path
      # users_show_path
      redirect_to user_path(user)
    # else
    #
    # end
    else
      flash[:error] = "Your password or email is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You successfully logged out"
    #redirect_to users_path
    redirect_to login_path
  end
  end
