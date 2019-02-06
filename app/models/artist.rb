class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug
    name = self.name.downcase
    name_array = name.split(/\W/).delete_if {|w| w == "" }
    slugified_name = name_array.join("-")
    slugified_name
  end

  def self.find_by_slug(slug)
    name_array = slug.split("-")
    name_array = name_array.map { |w| w.capitalize }
    deslugged_name = name_array.join(" ")
    self.find_by(:name => deslugged_name)
  end
end
