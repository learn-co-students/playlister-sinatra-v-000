class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres 
  has_many :genres, :through => :song_genres
  
  def slug 
    binding.pry
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
  
  def self.find_by_slug(slug)
    @songs = Song.all 
    @songs.detect{|song| song.slug == slug}
  end
end