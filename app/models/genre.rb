class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  extend  Useful::ClassMethods
  include Useful::InstanceMethods

  @@artists = []

  def artists
    self.songs.each {|song| @@artists << song.artist}
    @@artists
  end

end
