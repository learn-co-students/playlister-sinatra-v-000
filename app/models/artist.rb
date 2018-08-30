require_relative './concerns/slugifiable'

class Artist < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, :through => :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug (slug)
    Artist.all.find { |name| name.slug == slug }
  end

end
