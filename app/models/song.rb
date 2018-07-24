
class Song < ActiveRecord::Base
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end