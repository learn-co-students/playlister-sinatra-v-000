class Song < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
end
