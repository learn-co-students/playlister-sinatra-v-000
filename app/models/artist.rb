class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

# We are repeating a ton of code here. These two methods could go into a module.

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
