class Genre < ActiveRecord::Base
  extend Slugify::ClassMethod
  include Slugify::InstanceMethod

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
