class Neighborhood < ActiveRecord::Base
  has_many :profiles
  has_one :crime
end
