class RegionsController < ApplicationController
  def index
    render json: { regions: Region.all }
  end

  def geojson_strata
    render json: {
        type: 'FeatureCollection',
        features: region.countries.map(&:features).flatten
    }
  end

  def geojson_map
    render json: region.geojson_map
  end

  def dpps
    render json: region.dpps(year)
  end

  def add
    render json: region.add(year)
  end

  private
  def region
    Region.find_by_id(params[:id])
  end

  def year
    params[:year] || 2013
  end
end
