class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

#must be run on a song instance
  def slug
    #s = self.name
    #s.downcase.gsub(" ","-")
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(sluggy)
    Song.all.find{|song| song.slug == sluggy}
  end

end
