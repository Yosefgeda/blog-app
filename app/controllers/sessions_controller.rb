class SessionsController < ApplicationController
  def new
    render 'devise/sessions/new'
  end

  def destroy
    sign_out(current_user)
    redirect_to new_user_session_path, notice: 'You have been signed out successfully.'
  end
end
