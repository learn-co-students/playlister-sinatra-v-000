class Artist < ActiveRecord::Base
  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug) #now given the slug we can find the name!
    self.all.detect{ |artist| artist.slug == slug}
  end
end
