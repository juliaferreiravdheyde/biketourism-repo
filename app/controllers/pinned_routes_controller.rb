class PinnedRoutesController < ApplicationController

  def create
    route = Route.find(params[:route_id])
    current_user.pinned_route = route
    current_user.save!
    redirect_to route_path(route)
  end
end
