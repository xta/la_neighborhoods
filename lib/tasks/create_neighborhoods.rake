namespace :neighborhoods do

  desc "create neighborhoods"
  task :create => :environment do
    neighborhoods_data_path = Rails.root.join('data', 'neighborhoods.txt')

    file = File.open(neighborhoods_data_path, "r")
    data = file.read
    file.close

    neighborhoods = data.split("\n")

    neighborhoods.each do |n|
      url = n.split(" => ").first
      name = url[51...-1]
      Neighborhood.create(name: name, url: url)
    end

  end
end
