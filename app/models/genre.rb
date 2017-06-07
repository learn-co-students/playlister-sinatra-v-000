class Genre < ActiveRecord::Base
  extend Parser::ClassMethods
  include Parser::InstanceMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
