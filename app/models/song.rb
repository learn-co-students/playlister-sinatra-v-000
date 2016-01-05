class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end