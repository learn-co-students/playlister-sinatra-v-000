class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def artist_name
    self.artist && self.artist.name
  end
end
