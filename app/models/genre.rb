class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # strip out special characters & refactor to module
  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |genre|
      genre.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
