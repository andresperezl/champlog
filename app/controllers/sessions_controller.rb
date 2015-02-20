class SessionsController < ApplicationController
	def new
	unless logged_in?
  		@user ||= User.new
  	else
  		redirect_to user_path(current_user), notice: 'You have already logged in'
  	end
  end

  def create
  	user = User.where("LOWER(summoner_name) = ? AND region = ?",
  	 login_params[:summoner_name].downcase, login_params[:region]).first unless login_params[:summoner_name].nil? || login_params[:region].nil?
    if user && user.authenticate(login_params[:password])
      log_in user
      login_params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render "new"
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

  private 
  	def login_params
  		params.require(:session).permit(:summoner_name, :region, :password, :remember_me)
  	end
end
