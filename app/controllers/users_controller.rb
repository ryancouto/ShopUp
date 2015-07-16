class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			render :show
		else
			flash.now[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render :show
		else
			flash.now[:errors] = @user.errors.full_messages
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_url
	end


	private
	def user_params
		params.require(:user).permit(:password, :email, :fname, :lname)
	end

end
