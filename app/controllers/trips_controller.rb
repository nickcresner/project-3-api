class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!


  # GET /trips
  def index
    @trips = Trip.all

    render json: @trips
  end

  # GET /trips/1
  def show
    render json: @trip, include: ['comments.user']
  end

  # POST /trips
  def create
    @trip = Trip.new(Uploader.upload(trip_params))
    @trip.user = current_user
    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    return render json: { errors: ["Unauthorized"] }, status: 401 if @trip.user != current_user
    if @trip.update(Uploader.upload(trip_params))
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    return render json: { errors: ["Unauthorized"] }, status: 401 if @trip.user != current_user
    @trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.permit(:name, :country, :user_id, :start_date, :end_date, :info, :image, :base64, attendee_ids:[], leg_ids:[])
    end
end
