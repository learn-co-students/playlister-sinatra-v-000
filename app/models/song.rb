class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
end
