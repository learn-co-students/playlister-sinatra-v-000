class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artist_genres
  has_many :artists, through: :artist_genres

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
