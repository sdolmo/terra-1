class SellersController < ApplicationController
	
	def new

		@seller = Seller.new
		@listing = @seller.listings.build
	end

	def create
		
		@seller = Seller.find_or_create_by(email: seller_params[:email])
		byebug
		
		#@listing = @seller.listings.create
		#Checks to see if the person already exists
		
		# if @seller = Seller.find_by_email(seller_params)
		# 	#redirect to the make a new listing view

  #   	else #they aren't in the database, create them, then link to the make a new listing
  #   		@seller = Seller.create(seller_params)
  #   		#redirect them to seller/listings/new
    	end
    









    	# Redirect the person to make a new listing
    	# After you redirect them, show them all of their listings @seller.listings.all << Listing.create

    	#What do you want to happen after the user is either made or found in the database
    	#This 

    	# if @seller.save <we would only need this if once the person is done entering in their name and email they have 2 options, THEY DONT HERE>
    	# 	#redirect make a new listing
    	# else
    	# 	#redirect you to make a new listing
    	# end

    	

    private

    def seller_params
    	params.require(:seller).permit(:name, :email, :listings_attributes => [:title, :acres, :price, :description]) #makes users fill out their name or email, or it will not allow them to go on
    end
end






