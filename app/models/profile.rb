class Profile < ActiveRecord::Base
  belongs_to :neighborhood

  # Population
  # Ethnicity
  # Income
  # Education
  # Age
  # Housing
  # Families
  # Military
  # Ancestry

  def tag_heading!
    return unless self.heading.nil?

    case self.raw_xml
    when /square miles/
      update_attribute(:heading, "Population")
    when /diverse/
      update_attribute(:heading, "Ethnicity")
    when /income/
      update_attribute(:heading, "Income")
    when /degree/
      update_attribute(:heading, "Education")
    when /median age/
      update_attribute(:heading, "Age")
    when /household size/
      update_attribute(:heading, "Housing")
    when /married/
      update_attribute(:heading, "Families")
    when /veterans/
      update_attribute(:heading, "Military")
    when /ancestries/
      update_attribute(:heading, "Ancestry")
    when /U.S. Census/
      update_attribute(:heading, "Population")
    when /widowed/
      update_attribute(:heading, "Families")
    when /divorced/
      update_attribute(:heading, "Families")
    end
  end
end
