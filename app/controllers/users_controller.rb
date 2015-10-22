class UsersController < ApplicationController

  def index
    @user = current_user
    #how to match user with all their listings
		@user_listings = current_user.listings
	end


	private

    def user_params
    	params.require(:user).permit(:username, :email, :name, :listings_attributes => [:title, :acres, :price, :description, :latitude, :longitude, :image])
    end
end
