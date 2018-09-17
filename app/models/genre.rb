require_relative "module/slug"

class Genre < ActiveRecord::Base
  include Slug
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def self.find_by_slug(slug)
    Genre.all.find{ |a| a.slug == slug}
  end
end
