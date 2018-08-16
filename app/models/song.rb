class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slugged)
    Song.all.find do |song|
      song.slug == slugged
    end
  end
end
