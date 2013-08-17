class SessionsController < ApplicationController

  def new
    redirect_to '/auth/google_oauth2'
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

    # set tokens
    user.access_token = auth['credentials']['token']
    if refresh_token = auth['credentials']['refresh_token']
      user.refresh_token = refresh_token
    end
    user.save

    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      redirect_to root_url, :notice => 'Signed in!'
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
