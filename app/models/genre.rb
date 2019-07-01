class Genre < ActiveRecord::Base
  has_many :song_genre
  has_many :songs, through: :song_genre
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      genre.slug == slug
    end
  end

  def slug
    name.downcase.gsub(" ","-")
  end
end
