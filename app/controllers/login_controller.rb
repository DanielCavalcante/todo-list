class LoginController < ApplicationController
  def new
  end

  def create
      user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
          reset_session
          session[:user_id] = user.id
          redirect_to tasks_path
      end
  end

end
