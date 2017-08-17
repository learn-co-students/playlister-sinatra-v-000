class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    slug = name.downcase.gsub(" ","-")
    slug = slug.gsub(/[^0-9A-Za-z\-]/, '')
  end

  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end

end
