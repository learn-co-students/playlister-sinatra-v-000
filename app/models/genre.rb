class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      if genre.slug.kinclude?(slug)
        Genre.find_by(name: genre.name)
      end
    end
  end
end
