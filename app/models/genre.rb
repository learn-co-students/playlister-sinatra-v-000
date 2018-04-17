class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(" ","-").downcase
  end

  def self.find_by_slug(genre_slug)
    Genre.all.detect{|song| song.slug == genre_slug}
    #artist_name = slug.gsub("-"," ").split.collect do |word|
    #  word.capitalize
    #end
    #self.find_by(:name => artist_name.join(" "))
  end
end
