class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # refactor to module
  def slug
    self.name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
  end

  # doesn't add special characters back in and causes error
  def self.find_by_slug(slug)
    self.find do |genre|
      genre.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
