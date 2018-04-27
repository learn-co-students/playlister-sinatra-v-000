class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  #TODO: Strip out special characters as well: '"/?!@#$%^&*()
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect do |artist|
      artist.slug == slug
    end
  end
end
