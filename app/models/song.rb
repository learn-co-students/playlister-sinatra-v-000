require_relative './concerns/slugifiable.rb'

class Song < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres
  
end