class Song < ActiveRecord::Base
  extend Sluggifiable::ClassSlug
  include Sluggifiable::InstanceSlug
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end