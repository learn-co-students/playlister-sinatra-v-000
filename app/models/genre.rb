class Genre < ActiveRecord::Base
  has_many :artists, through: :songs, source: :artist
  has_many :song_genres
  has_many :songs, through: :song_genres

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
