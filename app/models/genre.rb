class Genre < ActiveRecord::Base
  #name
  has_many :song_genres
  has_many :songs, through: :song_genres
  # has_many :artist_genres
  has_many :artists, through: :songs

  def slug
    Slugifiable.new.slug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find{|a| Slugifiable.new.slug(a.name)==slug}
  end
end
