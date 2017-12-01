class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Genre.find do |genre|
      if genre.slug == slug
         return genre
      end
    end
  end
end
