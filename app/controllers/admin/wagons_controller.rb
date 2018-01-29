class Admin::WagonsController < Admin::BaseController
  before_action :add_ordinal_to_wagon_params, only: :update
  before_action :set_train, only: [:new, :create]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
    @wagon = @wagon.becomes(Wagon)
  end

  def create
    @wagon = @train.wagons.build(wagon_params)
    if @wagon.save
      redirect_to admin_train_path(@train), notice: t(".notice")
    else
      @wagon = @wagon.becomes(Wagon)
      render :new
    end
  end

  def update
    @wagon = @wagon.becomes(wagon_params[:type].constantize)
    if @wagon.update(wagon_params)
      redirect_to admin_wagon_path(@wagon), notice: t(".notice")
    else
      @wagon = @wagon.becomes(Wagon)
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_train_path(@wagon.train), notice: t(".notice")
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    @wagon_params ||= params.require(:wagon)
                            .permit(:type, :bottom_places, :upper_places, :seat_places,
                                    :side_bottom_places, :side_upper_places)
  end

  def add_ordinal_to_wagon_params
    wagon_params.merge!(ordinal: params[:wagon][:ordinal])
  end
end
