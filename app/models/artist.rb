class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Artist.all.select do |artist|
      artist.slug == slug
    end[0]
  end
end
