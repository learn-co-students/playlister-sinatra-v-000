class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, :through => :song_genres

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(par)
    Song.all.find{|song| song.slug == par}
  end
end