require_relative './concerns/slugs'

class Genre < ActiveRecord::Base
  extend Slugs::ClassSlug
  include Slugs::InstanceSlug

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end
