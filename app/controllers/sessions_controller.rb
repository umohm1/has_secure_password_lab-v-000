class SessionsController < ApplicationController


  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to '/'
    else
      redirect_to('/login')
    end
  end


  def destroy
    session.clear
  end

end
