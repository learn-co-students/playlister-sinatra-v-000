class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    #no_slug = slug.split("-").map(&:capitalize).join(" ")
    no_slug = slug.split("-").join(" ")
    #Artist.find_by name: no_slug
    artist = Artist.select do |artist|
      artist.name.downcase == no_slug
    end
    artist[0]
  end

end
