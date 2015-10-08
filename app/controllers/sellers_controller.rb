class SellersController < ApplicationController

	
	def new #preparing to build
		@seller = Seller.new
		@listing = @seller.listings.build
		# @location = @listing.build_location
		@location = @listing.locations.build
	end

	def create
		byebug
		@seller = Seller.find_or_create_by(name: seller_params[:name], email: seller_params[:email])
		@listing = @seller.listings.create(seller_params[:listings_attributes])
		# @location = @listing.create_location(seller_params[:listings_attributes]["1"])
		@location = @listing.locations.create(seller_params[:location]["0"])
		redirect_to @seller
	end
		# redirect_to @seller
		# render "seller/show"



		#next step is to redirect seller to all their listings, 
		#redirect_to @seller seller/1 ..etc, for that particular seller. Route =>show def show
	
   
	def show
		@seller = Seller.find(params[:id])
		#how to match seller with all their listings
		@seller_listings = @seller.listings.all
	end




	private

    def seller_params
    	params.require(:seller).permit(:name, :email, :listings_attributes => [:title, :acres, :price, :description], :location =>[:latitude, :longitude])
    end
end






