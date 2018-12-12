require_relative 'concerns/slugifiable.rb'

class Song < ActiveRecord::Base

  include Slugifiable #so we can use as instance method
  extend Slugifiable #so we can use as class method for methods like Artist.find_by_slug

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


end
