require_relative './concerns/slugifiable'

class Song < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.all.find { |name| name.slug == slug }
  end

end
