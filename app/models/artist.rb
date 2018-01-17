# class Artist < ActiveRecord::Base
#   has_many :songs
#   has_many :genres
#
#     @@artists = []
#     def initialize(params)
#       @name = name
#       @genre = genre
#       @@artists << self
#     end
#
#     def self.all
#       @@artists
#     end
#   end

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs
  
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

# We are repeating a ton of code here. These two methods could go into a module.

  # def slug
  #   name.downcase.gsub(" ","-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Artist.all.find{|artist| artist.slug == slug}
  # end
end
