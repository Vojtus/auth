class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_param)

  	if @user.save
  		flash[:notice] = "You are now a user!"
  		sign_in @user #Method in controller
  		redirect_to root_url
  	else
  		render "new" 
  	end
  end


  private
  def user_param
  	params.require(:user).permit(
  		:email, :password, :password_confirmation
  	)
  end
end
