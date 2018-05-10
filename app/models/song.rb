class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  #Slug method expected output /songs/Blank Space ==> /songs/blank-space
  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end

end
