class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    self.name.downcase.gsub(/\s/, '-')
  end
  
  def self.find_by_slug(slug)
    all.find{|artist| artist.slug == slug}
  end
end