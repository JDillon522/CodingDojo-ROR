class UsersController < ApplicationController
  def index
  	@user_data = User.all 
  end

  def create
	  	@new_user = User.new(params[:user])

	  	respond_to do |format|
			if @new_user.save
				format.html { redirect_to users_path, notice: 'Post was successfully created.' }
				format.json { render json: @new_user, status: :created, location: @user }
			else
				format.html { render action: "new" }
				format.json { render json: @new_user.errors, status: :unprocessable_entity }
			end
		end
	end

  def new
  	@new_user = User.new
  end

end
