class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    self.all.find{ |c| c.slug == slug}
  end

  def slug
    name.downcase.gsub(" ","-")
  end
end
