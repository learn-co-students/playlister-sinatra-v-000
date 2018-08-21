require_relative './concerns/slugifiable'
class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :genres, through: :song_genres
  has_many :song_genres
  belongs_to :artist
end