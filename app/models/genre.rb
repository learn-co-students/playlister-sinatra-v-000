class Genre < ActiveRecord::Base
  include Slugable
  extend Findable

  has_many :song_genres
  has_many :songs, through: :song_genres

  def artists
    self.songs.map{|song| song.artist}
  end

end