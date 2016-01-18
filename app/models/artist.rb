class Artist < ActiveRecord::Base
  include Slugable
  extend Findable

  has_many :songs

  def genres
    self.songs.flat_map{|song| song.genres}
  end

end