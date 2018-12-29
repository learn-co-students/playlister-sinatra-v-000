class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  # strip out special characters & refactor to module
  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |song|
      song.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
