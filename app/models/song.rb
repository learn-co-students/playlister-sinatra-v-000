class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  include Slugify::InstaceMethods
  extend Slugify::ClassMethods
end
