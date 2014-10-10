class Neighborhood < ActiveRecord::Base
  serialize :polygon, Hash

  has_many :profiles
  has_one :crime

  PROFILE_REJECT_LIST = %w(military population housing age families)

  def show_profiles
    self.profiles.reject do |profile|
      PROFILE_REJECT_LIST.include?(profile.heading.downcase)
    end
  end
end
