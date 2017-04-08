class Artist < ActiveRecord::Base

  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  extend Slugifiable::ClassMethods, FindOrCreate
  include Slugifiable::InstanceMethods

end
