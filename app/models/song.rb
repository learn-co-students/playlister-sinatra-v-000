class Song < ActiveRecord::Base
  belongs_to :artists
  has_many :song_genres
  has_many :genres, :through => :songs_genres

  def slug
    name.downcase.strip("","-")
  end

  def self.find_by_slug(slug)
    Song.all.find { |song| song.slug == slug}
  end

end
