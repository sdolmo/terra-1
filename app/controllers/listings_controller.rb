#this is where we'll show a specific listing to the buyer, and to the seller
class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all
  end

  def show 

  end
end

