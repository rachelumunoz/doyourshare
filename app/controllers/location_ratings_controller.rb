class LocationRatingsController < ApplicationController
  before_action :set_location_rating, only: [:show, :edit, :update, :destroy]

  # GET /location_ratings
  # GET /location_ratings.json
  def index
    @location_ratings = LocationRating.all
  end

  # GET /location_ratings/1
  # GET /location_ratings/1.json
  def show
  end

  # GET /location_ratings/new
  def new
    @location_rating = LocationRating.new
    @location_rating.email = session['email']
    locations = [{lat:32.756033,long:-117.199059}, {lat:41.052942,long:-73.543161}, {lat:37.7918105,long:-122.4058103}, {lat:34.0110435,long:-118.4915798}, {lat:32.711534,long:-117.159377}, {lat:33.127639,long:-117.1653983}]
    location = locations.sample
    @location_rating.lat = location[:lat]
    @location_rating.long = location[:long]
  end

  # GET /location_ratings/1/edit
  def edit
    @location_rating.email = session['email']
  end

  # POST /location_ratings
  # POST /location_ratings.json
  def create
    @location_rating = LocationRating.new(location_rating_params)

    respond_to do |format|
      if @location_rating.save
        format.html { redirect_to new_location_rating_path, notice: 'Location rating was successfully created.' }
        format.json { render :show, status: :created, location: @location_rating }
      else
        format.html { render :new }
        format.json { render json: @location_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_ratings/1
  # PATCH/PUT /location_ratings/1.json
  def update
    respond_to do |format|
      if @location_rating.update(location_rating_params)
        format.html do
          location_rating = LocationRating.where(rating:nil).first
          if location_rating  
            redirect_to edit_location_rating_path(location_rating) 
          else
            redirect_to location_ratings_path
          end    
        end
        format.json { render :show, status: :ok, location: @location_rating }
      else
        format.html { render :edit }
        format.json { render json: @location_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_ratings/1
  # DELETE /location_ratings/1.json
  def destroy
    @location_rating.destroy
    respond_to do |format|
      format.html { redirect_to location_ratings_url, notice: 'Location rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_rating
      @location_rating = LocationRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_rating_params
      params.require(:location_rating).permit(:lat, :long, :rating, :email)
    end
end
