class RentalsController < ApplicationController

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    new_params = rental_params.merge(rental_params) { |k, v| v.to_i  }
    if Rental.create(new_params)
      redirect_to rentals_path
    else
      render :new
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    rental = Rental.find(params[:id])
    new_params = rental_params.merge(rental_params) { |k, v| v.to_i  }

    if rental.update_attributes!(new_params)
      flash[:success] = 'Rental successfully created'
    else
      flash[:error] = 'Error creating rental'
    end
    redirect_to rentals_path
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.present?
      @rental.travels.delete_all
      @rental.delete
    end
    redirect_to rentals_path
  end

  def rental_params
    params.require(:rental).permit(:make, :model, :vehicle, :engine, :energy)
  end

end
