
class Genre < ActiveRecord::Base

  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

  def slug
    unslugged = self.name
    unslugged = unslugged.split(" ")
    slugged = unslugged.join("-").downcase
    slugged
  end

  def self.find_by_slug(slug)
     Genre.all.find{|genre| genre.slug == slug}
  end

end