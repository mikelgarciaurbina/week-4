class UsersController < ApplicationController
  def form
  end

  def login
    user = User.find_by(email: params[:user][:email])
    unless user
      redirect_to user_login_path
    end
    if user.password == params[:user][:password]
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to user_login_path
    end
  end
end
