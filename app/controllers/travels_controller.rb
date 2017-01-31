class TravelsController < ApplicationController

  def index
    @rental = Rental.find(params[:rental_id])
    @travels = @rental.travels
  end

  def new
    @travel = Travel.new(rental_id: params[:rental_id])
  end

  def create
    @file = params[:file]

    unless @file && @file.try(:tempfile)
      flash[:error] = 'Location file is missing'
      redirect_to new_rental_travel_path(params[:rental_id])
    else
      @travel = Travel.create(rental_id: params[:rental_id])
      @travel.file = @file.tempfile
      @travel.process
      redirect_to edit_rental_travel_path(@travel.rental, @travel)
    end
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @file = params[:file]

    unless @file && @file.try(:tempfile)
      flash[:error] = 'Location file is missing'
      redirect_to new_rental_travel_path(params[:rental_id])
    else
      @travel = Travel.find(params[:id])
      # First we need to delete all existing positions
      @travel.positions.delete_all
      @travel.file = @file.tempfile
      @travel.process
      redirect_to rental_travels_path
    end
  end

  def destroy
    @travel = Travel.find(params[:id])
    if @travel.present?
      @travel.positions.destroy_all
      @travel.delete
    end
    redirect_to rental_travels_path
  end

  def travel_params
    params.require(:travel).permit(:rental_id, :start_time, :end_time, :distance)
  end

end
