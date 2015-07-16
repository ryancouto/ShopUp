class PagesController < ApplicationController

	def index
		@shops = Shop.all
	end
	
end
