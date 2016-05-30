require_relative "../helpers/support_modules"

class Genre < ActiveRecord::Base
  include Slugs

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    name = Slugs.unslug(slug)
    self.find_by_name(name)
  end
end
