class UsersController < ApplicationController
  def index
  	@user_data = User.all 
  end

  def new
  end
end
