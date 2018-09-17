require_relative "module/slug"

class Song < ActiveRecord::Base
  include Slug
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist

  def self.find_by_slug(slug)
    Song.all.find{ |a| a.slug == slug}
  end
end
