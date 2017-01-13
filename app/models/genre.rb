class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    genreprime = nil
    self.all.each { |genre| genreprime = genre if genre.slug == slug }
    genreprime
  end
end
