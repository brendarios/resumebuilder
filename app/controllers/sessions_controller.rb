class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']

      user = User.get_user(auth_hash)

      if user.nil?

        redirect_to root_path
        return
      end
      session[:uid] = user.uid

      redirect_to new_resume_path
      return
    else
      flash[:error] = 'Could not log in'
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:uid)
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end

end
