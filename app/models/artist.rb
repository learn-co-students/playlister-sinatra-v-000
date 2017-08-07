class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

#   You'll need to build a method slug which takes a given song/artist/genre name and create the "slugified" version.
# The find_by_slug method should use the slug method to retrieve a song/artist/genre from the database and return that entry.
  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
