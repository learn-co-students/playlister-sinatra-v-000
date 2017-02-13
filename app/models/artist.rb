class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    @slug = self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    Artist.all.find {|a| a.slug == slug}
  end
end
