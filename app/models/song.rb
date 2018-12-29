class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  # refactor to module
  def slug
    self.name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
  end

  def self.find_by_slug(slug)
    self.find do |song|
      song.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
