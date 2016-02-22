class Song < ActiveRecord::Base
  
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  belongs_to :artist
  has_many :songs_genres
  has_many :genres, through: :songs_genres

end