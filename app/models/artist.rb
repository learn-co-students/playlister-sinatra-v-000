require_relative "../../lib/slugify.rb"

class Artist < ActiveRecord::Base

  include Slugify::InstanceMethod
  extend Slugify::ClassMethod

  has_many :songs
  has_many :genres, through: :songs

  # def slug
  #   self.name.downcase.gsub(" ","-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Artist.all.find {|artist| artist.slug == slug}
  # end

end
