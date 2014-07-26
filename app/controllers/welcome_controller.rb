class WelcomeController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	user_logged_in!
  end
end
