require_relative 'concerns/slugifiable'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

# We are repeating a ton of code here. These two methods could go into a module.

  # def slug
  #   maxlength = 35
  #   title = name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  #   return title[0, title.length > maxlength ? (title[0, maxlength].rindex('-') or maxlength) : maxlength]
  # end
  #
  # def self.find_by_slug(slug)
  #   Artist.all.find{|artist| artist.slug == slug}
  # end
end
