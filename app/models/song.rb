class Song < ActiveRecord::Base

  include Slugify::InstanceMethod
  extend Slugify::ClassMethod
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
