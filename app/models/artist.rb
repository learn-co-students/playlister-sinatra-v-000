class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs


  # converts an artist name from "Taylor Swift" to "taylor-swift"
  def slug
    name.downcase.gsub(' ', '-')
  end

  # finds the artist by the slugified version of their name
  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

end