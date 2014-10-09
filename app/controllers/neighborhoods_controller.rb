require 'json'

class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.includes(:crime).includes(:profiles).all
    @geojson = all_geojson
  end

  def show
    @neighborhood = Neighborhood.find_by_name(params[:id])
    @neighborhood = Neighborhood.find(params[:id]) if @neighborhood.nil?
  end

  private

  def all_geojson
    polygons_data_path = Rails.root.join('data', 'la_county_simplified.json')
    File.read(polygons_data_path)
  end

end
