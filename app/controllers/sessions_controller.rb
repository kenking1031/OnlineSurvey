class SessionsController < ApplicationController

  def create

    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to root_path
    else
      flash[:error] = "Invalid login/password combination"
      redirect_to root_path
    end

  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end

end
