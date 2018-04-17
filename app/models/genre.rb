class Genre < ActiveRecord::Base
  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug) #now given the slug we can find the name!
    self.all.detect{ |genre| genre.slug == slug}
  end
end
