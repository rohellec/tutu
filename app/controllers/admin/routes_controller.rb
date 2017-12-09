class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :new_station, :add_station]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to admin_route_path(@route), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to admin_route_path(@route), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, notice: t(".notice")
  end

  def new_station
    @stations = RailwayStation.all - @route.railway_stations
  end

  def add_station
    @route.add_station(route_station_params)
    redirect_to admin_route_path(@route)
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end

  def route_station_params
    params.require(:station).permit(:railway_station_id, :arrival_time, :departure_time, :position)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
