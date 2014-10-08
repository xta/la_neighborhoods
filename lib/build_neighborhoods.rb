require 'open-uri'
require 'nokogiri'

ROOT_PATH = "http://maps.latimes.com/neighborhoods/"
BASE_PATH = "http://maps.latimes.com/neighborhoods/neighborhood/"
DATA_FILE = "data/neighborhoods.txt"

if File.exist?(DATA_FILE)
  puts "File #{DATA_FILE} already exists, exiting."
  exit
end

doc = Nokogiri::HTML(open(ROOT_PATH))

neighborhoods_select = doc.css('form select').first do |form|
  form.content.include? "Los Angeles"
end

# puts neighborhoods_select.element_children.size
#= 272

# puts neighborhoods_select.element_children.first.class
#=> Nokogiri::XML::Element

neighborhoods = neighborhoods_select.element_children.map do |el|
  el.attribute('value')
end

def check_status(uri)
  open(uri) do |f|
    f.status
  end
end

def build_path(neighborhood)
  BASE_PATH + neighborhood + "/"
end

def save(data)
  open(DATA_FILE, 'a') do |f|
    f << data
    f << "\n"
  end
end

neighborhoods.each do |n|
  puts "checking #{n}..."
  path = build_path(n)
  status = check_status(path).first
  save(path + " => " + status)
  sleep 0.5
end
