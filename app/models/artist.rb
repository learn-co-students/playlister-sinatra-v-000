class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    slug = self.name.downcase.split(/\W|\s/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
end
