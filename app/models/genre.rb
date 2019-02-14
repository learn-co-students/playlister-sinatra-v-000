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
    Genre.all.find { |genre| genre.slug == slug }
  end

end
