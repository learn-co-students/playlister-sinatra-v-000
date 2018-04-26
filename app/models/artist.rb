class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(artist_slug)
    Artist.all.find {|artist| artist.slug == artist_slug}
  end

end
