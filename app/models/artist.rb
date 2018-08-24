class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.slug(name)
    
  end

  def find_by_slug
    self.slug
  end
end
