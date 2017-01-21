class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres #looks through table for song_id
  #include Slugifiable::InstanceMethods
  #extend Slugifiable::ClassMethods
end
