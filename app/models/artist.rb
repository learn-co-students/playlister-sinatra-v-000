class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    #strip special characters and replace with -
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(arg)
    #binding.pry
    Artist.all.find{|artist| artist.slug == arg}
  end
end
