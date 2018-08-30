require_relative './concerns/slugifiable'

class SongGenre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods

  belongs_to :song
  belongs_to :genre

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.find { |name| name.slug == slug }
  end

end
