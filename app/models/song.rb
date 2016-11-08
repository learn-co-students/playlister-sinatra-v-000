class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    #strip special characters and replace with -
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(arg)
    #binding.pry
    Song.all.find{|song| song.slug == arg}
  end
end
