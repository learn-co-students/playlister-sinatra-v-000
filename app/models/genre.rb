class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(genre_name)
    Genre.all.find do |genre|
      genre.name.downcase == genre_name.gsub('-', ' ')
    end
  end

end
