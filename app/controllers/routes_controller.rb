class RoutesController < ApplicationController
  before_action :set_routes, only: %i[show]

  def index
    @routes = Route.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.save!
  end

  private

  def set_routes
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :description, :type_of_route, :photos, :positive_elevation)
  end
end
