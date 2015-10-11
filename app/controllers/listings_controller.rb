#this is where we'll show a specific listing to the buyer, and to the seller
class ListingsController < ApplicationController
  before_action only: [:show]

  def index
    # binding.pry
    @listings = Listing.all
  end

  def show 
    @listing = Listing.find(params[:id])
    @seller = Seller.find_by(:id => @listing.seller_id)
  end

  def edit
    # binding.pry
    @listing = Listing.find(params[:id])
    @seller_id = params[:seller_id]
  end

  def update
    @listing = Listing.find(params[:id])
    @seller = Seller.find_by(:id => @listing.seller_id)
    @listing.update(listing_params)
    redirect_to @seller 
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :acres, :price, :description, :latitude, :longitude, :image)
  end
end

