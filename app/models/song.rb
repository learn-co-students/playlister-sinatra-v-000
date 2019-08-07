class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
      self.name.gsub(/ /, '-').downcase
  end

  def self.find_by_slug(slug)
    song_name = slug.gsub(/-/, ' ')
    Song.all.each do |song|
      if song.name.downcase == song_name
        @song = song
      end
    end
    @song
  end

end
