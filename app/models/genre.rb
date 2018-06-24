class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    reverse_slug = slug.gsub("-"," ").split.map{|w| w.capitalize}.join(" ")
    self.all.find_by(name: reverse_slug)
  end
  
end
