require_relative './concerns/slugifiable'

class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods

  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.find { |name| name.slug == slug }
  end
end
