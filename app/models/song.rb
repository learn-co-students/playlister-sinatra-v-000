class Song < ActiveRecord::Base
  include Slugifiable::Instance
  extend Slugifiable::Class

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end