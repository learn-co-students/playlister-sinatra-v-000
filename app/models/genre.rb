require 'pry'
class Genre < ActiveRecord::Base

  include Slug
  extend Slug_Cl
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

end
