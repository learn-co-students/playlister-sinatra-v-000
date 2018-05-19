class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    artist = Artist.all.select{|artist| artist.slug == slug}
    artist.first
  end
end
