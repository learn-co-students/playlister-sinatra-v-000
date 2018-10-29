class Artist < ActiveRecord::Base
  #name
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.new.slug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find{|a| Slugifiable.new.slug(a.name)==slug}
  end
end
