class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres
  include Sluggable::InstanceMethods
  extend Sluggable::ClassMethods
end
