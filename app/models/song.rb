class Song < ActiveRecord::Base

  include Slugifiable
  extend FindBySlug

  belongs_to :artist
  has_many :song_genres
  has_many :genre, :through => :song_genres
end