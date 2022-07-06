class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = User.authenticate_with_credentials(session_params[:email], session_params[:password]))
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
