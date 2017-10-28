class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon, notice: 'Wagon was successfully created.'
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to wagon_path(@wagon), notice: 'Wagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:train_id, :wagon_type, :bottom_places, :upper_places,
                                  :side_bottom_places, :side_upper_places, :seat_places)
  end
end
