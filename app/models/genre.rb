class Genre < ActiveRecord::Base
  has_many :genre_songs
  has_many :songs, :through => :genre_songs
  has_many :artists, :through => :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-")
    name.map! do |a|
      a.capitalize
    end
    name = name.join (" ")
    self.find_by_name(name)
  end
  
end