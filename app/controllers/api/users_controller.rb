class Api::UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login(@user)
			render :show
		else
			render json: @user.errors.full_messages, status: :unprocessable_entity
		end
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			render :show
		else
			render json: @user.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json: {}
	end


	private
	def user_params
		params.require(:user).permit(:password, :email, :fname, :lname)
	end

end
