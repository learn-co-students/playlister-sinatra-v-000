class Genre < ActiveRecord::Base
has_many :artists, through: :songs
has_many :song_genres
has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.detect do |genre|
      genre.slug == slug
    end
  end
end
