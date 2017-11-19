class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods #moved slug methods into concerns
  extend Slugifiable::ClassMethods #moved slug methods into concerns

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
