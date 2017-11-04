class RoutesController < ApplicationController
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
      redirect_to @route
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  def new_station
    @stations = RailwayStation.all - @route.railway_stations
  end

  def add_station
    @route.add_station(params[:station], params[:position])
    redirect_to @route
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
