class Genre < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
