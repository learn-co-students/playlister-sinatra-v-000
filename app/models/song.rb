#require 'slugifyer'

class Song < ActiveRecord::Base
  extend Slugifyer::ClassMethods
  include Slugifyer::InstanceMethods
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end