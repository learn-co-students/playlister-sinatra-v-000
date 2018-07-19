class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.strip.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      slug == genre.slug
    end
  end

end
