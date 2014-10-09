require 'json'

namespace :polygons do

  desc "create neighborhood polygons"
  task :create => :environment do

    polygons_data_path = Rails.root.join('data', 'la_county_simplified.json')

    file = File.read(polygons_data_path)
    data_hash = JSON.parse(file)

    data_hash['features'].each do |feature|
      slug = feature['properties']['slug']
      neighborhood = Neighborhood.find_by_name(slug)

      if neighborhood.polygon.nil?
        neighborhood.polygon = feature
        neighborhood.save
      end

      if neighborhood.center_lat.nil? && neighborhood.center_lng.nil?
        coords = feature['geometry']['coordinates'].flatten
        negative_coord = coords.select {|c| c < 0}
        positive_coord = coords.select {|c| c > 0}

        lat = (positive_coord.min + positive_coord.max)/2
        lng = (negative_coord.min + negative_coord.max)/2

        neighborhood.center_lat = lat
        neighborhood.center_lng = lng
        neighborhood.save
      end
    end

  end

end
