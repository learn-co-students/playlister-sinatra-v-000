class Song < ActiveRecord::Base
  include Slugifiable

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  after_initialize :add_slug

end
