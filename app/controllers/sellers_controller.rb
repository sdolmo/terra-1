class SellersController < ApplicationController

	
	def new #preparing to build
		@seller = Seller.new
		@listing = @seller.listings.build
	end

	def create
		@seller = Seller.find_or_create_by(name: seller_params[:name], email: seller_params[:email])
		@listing = @seller.listings.create(seller_params[:listings_attributes]["0"])
		redirect_to @seller
	end
		# redirect_to @seller	
   
	def show
		@seller = Seller.find(params[:id])
		#how to match seller with all their listings
		@seller_listings = @seller.listings.all
	end




	private

    def seller_params
    	params.require(:seller).permit(:name, :email, :listings_attributes => [:title, :acres, :price, :description, :latitude, :longitude])
    end
end






