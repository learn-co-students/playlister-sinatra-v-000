require_relative "../helpers/support_modules"

class Song < ActiveRecord::Base
  include Slugs

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    name = Slugs.unslug(slug)
    self.find_by_name(name)
  end
end
