#this is where we'll show a specific listing to the buyer, and to the seller
class ListingsController < ApplicationController
  before_action only: [:show]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    # binding.pry
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find_by(:id)
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
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
