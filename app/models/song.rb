class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.downcase
    name_array = name.split(/\W/).delete_if {|w| w == "" }
    slugified_name = name_array.join("-")
    slugified_name
  end

  def self.find_by_slug(slug)
    Song.all.find { |song| song.slug == slug }
  end

end
