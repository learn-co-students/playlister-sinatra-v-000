
class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    unslugged = self.name
    unslugged = unslugged.split(" ")
    slugged = unslugged.join("-").downcase
    slugged
  end

  def self.find_by_slug(slug)
   Artist.all.find{|artist| artist.slug == slug}
  end

end