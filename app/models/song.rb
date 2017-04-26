class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist
end
