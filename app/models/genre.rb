class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  #TODO: Strip out special characters as well: '"/?!@#$%^&*()
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect do |genre|
      genre.slug == slug
    end
  end
end
