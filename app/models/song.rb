require_relative './concerns/slugs'

class Song < ActiveRecord::Base
  extend Slugs::ClassSlug
  include Slugs::InstanceSlug

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
