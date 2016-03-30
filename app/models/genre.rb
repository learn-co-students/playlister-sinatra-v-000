class Genre < ActiveRecord::Base
  
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs

end