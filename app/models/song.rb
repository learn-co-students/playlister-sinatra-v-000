require_relative '../models/concerns/slugifiable'
class Song < ActiveRecord::Base
  extend Concerns::ClassMethods
  include Concerns::Slugifiable
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end