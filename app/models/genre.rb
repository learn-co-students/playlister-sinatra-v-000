class Genre < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
