class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(/\s|\.\W/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.map do |artist|
      return artist if artist.slug == slug
    end.first
  end


end
