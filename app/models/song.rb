class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  include Sluggable::InstanceMethods
  extend Sluggable::ClassMethods

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
