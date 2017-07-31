class SessionsController < ApplicationBaseController
  def new
    if current_user
      redirect_to '/jobs'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/jobs'
    else
      flash[:danger] = "Check your login credentials"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
