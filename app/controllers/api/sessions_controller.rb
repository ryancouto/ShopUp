class Api::SessionsController < ApplicationController

	def show
		if current_user
			render :show
		else
			render json: {}
		end
	end

	def create
		@user = User.find_by_credentials(
		params[:user][:email],
		params[:user][:password]
		)

		if @user
			login(@user)
			render :show
		else
			render json: :unprocessable_entity
		end
	end

	def destroy
		logout
		render json: {}
	end
end
