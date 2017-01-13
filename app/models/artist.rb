class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    artistprime = nil
    self.all.each { |artist| artistprime = artist if artist.slug == slug }
    artistprime
  end
end
