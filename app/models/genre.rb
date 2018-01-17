class Genre < ActiveRecord::Base

  include Slug::Instance
  extend Slug::Class

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end
