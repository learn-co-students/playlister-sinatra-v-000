class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end


#
# def genre_ids
#   self.genre.id
# end
