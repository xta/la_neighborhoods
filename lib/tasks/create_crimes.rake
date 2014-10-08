require 'open-uri'
require 'nokogiri'

namespace :crimes do

  desc "create crimes"
  task :create => :environment do
    crime_ranking_url = "http://maps.latimes.com/neighborhoods/violent-crime/neighborhood/list/"

    doc = Nokogiri::HTML(open(crime_ranking_url))
    crime_data = doc.css('.datagrid tbody tr')

    crime_data.each do |crime_data_point|
      begin
        crime_attrs = crime_data_point.css('td').map {|data_attr| data_attr.content.strip}
        neighborhood_name = crime_data_point.css('td')[1].css('a').attribute('href').to_s[28...-7]
        neighborhood = Neighborhood.find_by_name(neighborhood_name)

        next if neighborhood.nil? || crime_attrs.size != 4
        puts "Saving crime data for #{neighborhood.name}..."

        crime             = neighborhood.build_crime
        crime.rank        = crime_attrs[0].to_i
        crime.per_capita  = crime_attrs[2].to_f
        crime.total       = crime_attrs[3].to_i
        crime.save
      rescue Exception => e
        puts "Exception while saving crime data: #{e}"
      end
    end
  end

end
