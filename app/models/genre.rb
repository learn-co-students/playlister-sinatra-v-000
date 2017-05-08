class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods

  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ").titleize
    self.find_by(name: name)
  end

end