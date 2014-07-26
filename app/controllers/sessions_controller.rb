class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by email: params[:email].downcase
		if user && user.authenticate(params[:password])	
			#sign in
			session[:user_id] = user.id
			flash[:notice] = "You are sign in!"
			redirect_to root_url
		else
			flash.now[:alert] = "Invalid user email or password"
			render "new"
		end	
	end

	def destroy
		sign_out
		flash[:notice] = "You are now signed out!"
		redirect_to root_url
	end
end
