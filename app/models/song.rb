require_relative './slugify.rb'
class Song < ActiveRecord::Base
  extend Slugify

  before_save do
    self.slug = self.class.make_slug(name)
  end

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
