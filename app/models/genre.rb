class Genre < ActiveRecord::Base
  # A Genre can have multiple artists and multiple songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(" ", '-')
  end

  def self.find_by_slug(slug)
    Genre.all.find{ |genre| genre.slug == slug }
  end

end
