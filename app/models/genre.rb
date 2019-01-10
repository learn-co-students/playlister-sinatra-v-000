class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    Genre.all.find {|genre| genre.slug == slug}
  end
end
