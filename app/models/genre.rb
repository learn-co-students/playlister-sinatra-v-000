require_relative './slugify.rb'
class Genre < ActiveRecord::Base
  extend Slugify

  before_save do
    self.slug = self.class.make_slug(name)
  end

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
