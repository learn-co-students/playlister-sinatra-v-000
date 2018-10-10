class Song < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::ClassMethod
  has_many :genres, through: :song_genres
  has_many :song_genres
  belongs_to :artist

end
