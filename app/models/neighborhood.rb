class Neighborhood < ActiveRecord::Base
  serialize :polygon, Hash

  has_many :profiles
  has_one :crime
end
