class WagonsController < ApplicationController
  before_action :set_train, only: [:index, :new, :create]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = @train.wagons
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
    @wagon = @wagon.becomes(Wagon)
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save
      redirect_to @train, notice: 'Wagon was successfully created.'
    else
      @wagon = @wagon.becomes(Wagon)
      render :new
    end
  end

  def update
    @wagon = @wagon.becomes(wagon_params[:type].constantize)
    if @wagon.update(wagon_params)
      redirect_to wagon_path(@wagon), notice: 'Wagon was successfully updated.'
    else
      @wagon = @wagon.becomes(Wagon)
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:type, :bottom_places, :upper_places, :seat_places,
                                  :side_bottom_places, :side_upper_places)
  end
end
