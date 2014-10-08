require 'open-uri'
require 'nokogiri'

namespace :profiles do

  desc "create profiles"
  task :create => :environment do
    neighborhoods = Neighborhood.all

    neighborhoods.each do |neighborhood|

      begin
        puts "Creating profiles for #{neighborhood.name}..."

        doc = Nokogiri::HTML(open(neighborhood.url))
        neighborhood_data = doc.css('.neighborhoods-accordion-drawer-robocopy ul')

        neighborhood_data.each do |data|
          profile = neighborhood.profiles.build
          profile.raw_xml = data.to_xml
          profile.save
        end
      rescue Exception => e
        puts "Exception: #{e}"
      end

      sleep 0.5
    end

  end

  desc "name profile headings"
  task :name_heading => :environment do
    count = Profile.count
    Profile.all.each do |profile|
      puts "tagging profile id #{profile.id}/#{count}"
      profile.tag_heading!
    end
  end
end
