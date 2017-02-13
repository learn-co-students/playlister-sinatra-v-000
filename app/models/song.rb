class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    @slug = self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    Song.all.find {|a| a.slug == slug}
  end
end
