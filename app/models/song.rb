class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(" ","-").downcase
  end

  def self.find_by_slug(song_slug)
    #binding.pry
    #artist_name = song_slug.gsub("-"," ").split.collect do |word|
    #  word.capitalize
    #end
    Song.all.detect{|song| song.slug == song_slug}
    #self.find_by(:name => artist_name.join(" "))
  end
end
