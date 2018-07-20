class SessionsController < ApplicationController

  def create
    user = nil
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']

      begin
        user = User.get_user(auth_hash)
      rescue ResourceNotFoundException
        user = User.new
        user.uid = auth_hash['uid']
        user.save
      end

      if user.nil?

        redirect_to root_path
        return
      end
      session[:uid] = user.uid

      redirect_to sections_path
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
