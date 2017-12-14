class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    #strip out special characters and replace spaces with -
    #downcase name
    name.downcase.gsub(/[\s.'&+]/, '-')
  end
  
  def self.find_by_slug(slug)
    #binding.pry
    self.all.select {|artist| artist.slug == slug}.last
  end
end


