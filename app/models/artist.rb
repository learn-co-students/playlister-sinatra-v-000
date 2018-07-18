class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(' ').join('-')
  end
  def self.find_by_slug(slug)
    self.all.select{|artist| artist.slug == slug}.first
  end
end