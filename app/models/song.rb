class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.normalize_slug(slug)
    slug.split("-").map(&:capitalize).join(" ")
  end

  def self.find_by_slug(slug)
    self.all.find { |artist| artist.name == normalize_slug(slug) }
  end
end