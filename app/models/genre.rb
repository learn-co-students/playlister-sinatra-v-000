class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :artists, through: :songs #songs has an artist_id, which is how they can connect
  has_many :songs, through: :song_genres
  has_many :song_genres #complement for the above code - AR won't know it connects through song_genre  with just above code alone
end
