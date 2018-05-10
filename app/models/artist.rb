class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  #Slug method expected output /artist/John Mayer ==> /artist/john-mayer.
  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

end
