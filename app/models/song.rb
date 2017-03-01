class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    slug = self.name.downcase.strip.gsub(' ', '-')
    slug
  end

  def self.find_by_slug(slug)
    song = self.all.detect {|s| s.slug == slug}
    song
  end
end
