class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, :through => :song_genres
    has_many :artists, :through => :songs
  
  def slug 
    merge_name = self.name.split(" ")
    downcase_name = merge_name.collect do |word|
      word.downcase
    end
    downcase_name.join("-")
  end
  
  def self.find_by_slug(slug)
    Genre.all.detect{|artist| artist.slug == slug}
  end
  
end