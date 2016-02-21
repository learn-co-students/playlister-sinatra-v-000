class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  include Concerns::Slugifiable
  extend Concerns::Findable
end