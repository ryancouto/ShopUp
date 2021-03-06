class Api::ShopsController < ApplicationController

	def search
		query = params[:query].split('-')
		if query.length == 2
			@search_results = Shop.near(query[0], query[1])
		else
			@search_results = Shop.search_by_full_address(query[0])
		end
		render :search
	end

	def new
		if current_user
			@shop = current_user.shops.new
		else
			render @shop.errors.full_messages, status: :unprocessable_entity
		end
	end

	def create
		@shop = current_user.shops.new(shop_params)
		if @shop.save
			render json: @shop
		else
			render json: @shop.errors.full_messages, status: :unprocessable_entity
		end
	end

	def show
		@shop = Shop.find(params[:id])
		@reservations = @shop.reservations
	end

	def edit
		@shop = Shop.find(params[:id])
		if current_user.id == @shop.owner_id
			render json: @shop
		else
			flash.now[:errors] = ["Nice try, not your shop"]
			render json: flash.now[:errors]
		end
	end

	def update
		@shop = current_user.shops.find(params[:id])
		if @shop.update(shop_params)
			render json: @shop
		else
			render json: @shop.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		@shop = current_user.shops.find(params[:id])
		@shop.try(:destroy)
		render json: {}
	end

	def index
		@shops = Shop.all
	end

	private
	def shop_params
		params.require(:shop).permit(:owner_id, :address, :city, :description, :price, :size, :image)
	end
end
