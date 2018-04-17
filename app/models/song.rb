class Song < ActiveRecord::Base
  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug) #now given the slug we can find the name!
    self.all.detect{ |song| song.slug == slug}
  end

end
