class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres


  # converts a song name from "Blank Space" to "blank-space"
  def slug
    name.downcase.gsub(' ', '-')
  end

  # finds the song by the slugified version of its name
  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end

end