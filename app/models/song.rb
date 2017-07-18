class Song < ActiveRecord::Base

  belongs_to :artist

  has_many :song_genre_relationships
  has_many :genres, through: :song_genre_relationships

  extend Sluggable::ClassMethods
  include Sluggable::InstanceMethods

end