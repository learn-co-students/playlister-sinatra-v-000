require_relative "module/slug"

class Artist < ActiveRecord::Base
  include Slug

  has_many :songs
  has_many :genres, :through => :songs

  def self.find_by_slug(slug)
    Artist.all.find{ |a| a.slug == slug}
  end
end
