class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listings = Listing.new
  end

  def create
    @listing = Listing.new(post_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing}
      else
        format.html { render :new }
        format.json {render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end



private
# Use callbacks to share common setup or constraints between actions.
  def set_post
    @listing = Listing.find(params[:id])
  end
# Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :acres, :price, :description, :image)
  end



end
