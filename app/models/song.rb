class Song < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::Findable
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres



end
