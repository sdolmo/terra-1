#this is where we'll show a specific listing to the buyer, and to the seller
class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all
  end

  def show 

  end

  def edit
    binding.pry
    @listing = Listing.find(params[:id])
  end

  def update
    binding.pry
    @listing = Listing.find(params[:id])
    @seller = Seller.find(params[:seller][:id])
    @listing.update(listing_params)
    render :show
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :acres, :price, :description, :latitude, :longitude)
  end
end

