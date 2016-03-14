require_relative './concerns/slugification'

class Song < ActiveRecord::Base
  extend Slugification::ForClass
  include Slugification::ForInstance
  belongs_to :artist
  has_many :song_genre_binds
  has_many :genres, through: :song_genre_binds
end
