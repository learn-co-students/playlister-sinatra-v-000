class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  include Slugify::InstaceMethods
  extend Slugify::ClassMethods
end
