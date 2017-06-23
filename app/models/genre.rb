class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods


  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def genre_ids
    self.genre.id
  end
end
