class Song < ActiveRecord::Base 
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # include Slugify::InstanceMethods
  # extend Slugify::ClassMethods
  # A Song can belong to ONE Artist and multiple genres
  
end