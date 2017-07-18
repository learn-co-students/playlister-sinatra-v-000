class Genre < ActiveRecord::Base

  validates :name, presence: true

  has_many :song_genre_relationships

  has_many :songs, through: :song_genre_relationships
  has_many :artists, through: :songs

  extend Sluggable::ClassMethods
  include Sluggable::InstanceMethods

end