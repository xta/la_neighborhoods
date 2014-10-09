class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.includes(:crime).includes(:profiles).all
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end

end
