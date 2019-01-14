class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    merge_name = self.name.split(" ")
    downcase_name = merge_name.collect do |word|
      word.downcase
    end
    downcase_name.join("-")
  end
  
  def self.find_by_slug(slug)
    Song.all.detect{|artist| artist.slug == slug}
  end
  
end