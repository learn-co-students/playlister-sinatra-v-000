class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug
    #binding.pry
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    #binding.pry
    Artist.all.find{|artist| artist.slug == slug}
  end
end
