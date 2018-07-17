class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']

      user = User.get_user(auth_hash)

      if user.nil?

        redirect_to root_path
        return
      end
      session[:user_id] = user

      redirect_to new_resume_path
      return
    else
      flash[:error] = 'Could not log in'
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end

end
