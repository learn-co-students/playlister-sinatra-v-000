class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    slug = name.downcase.gsub(" ","-")
    slug = slug.gsub(/[^0-9A-Za-z\-]/, '')
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

end
