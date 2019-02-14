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
    Artist.all.find { |artist| artist.slug == slug }
  end
end
