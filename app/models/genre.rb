class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

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
