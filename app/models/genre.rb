class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres


def slug
  name.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
    self.all.find{ |i| i.slug == slug}
end
end
