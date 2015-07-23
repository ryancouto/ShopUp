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
			head :unprocessable_entity
		end
	end

	def destroy
		logout
		render json: {}
	end

	def omniauth
		user = User.find_or_create_by_auth_hash(auth_hash)
		login(user)
		redirect_to root_url
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end
