class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  #has multiple artists (through songs??)
  #has multiple songs
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

end
