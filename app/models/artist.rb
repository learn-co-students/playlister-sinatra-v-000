class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(artist_name)
    artist = Artist.find_by_name(artist_name.gsub('-', ' ').split(" ").map(&:capitalize).join(" "))
  end


end
