class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.downcase.strip.gsub(' ', '-')
    slug
  end

  def self.find_by_slug(slug)
    artist = self.all.detect {|s| s.slug == slug}
    artist
  end
end
