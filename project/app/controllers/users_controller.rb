class UsersController < ApplicationController
  
  def index
  	@user = User.all 
  end

  def new
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user }
		end
  end

  def create
	  	@user = User.new(params[:user])

	  	respond_to do |format|
			if @user.save
				format.html { redirect_to users_path, notice: 'Post was successfully created.' }
				format.json { render json: @user, status: :created, location: @user }
			else
				format.html { render action: "new" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  		@user = User.find(params[:id])
	  	respond_to do |format|	
			if @user.update_attributes(params[:user])
		        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
		        format.json { head :no_content }
		    else
		        format.html { render action: "edit" }
		        format.json { render json: @user.errors, status: :unprocessable_entity }
		    end
		end
  end

	def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
  

end
