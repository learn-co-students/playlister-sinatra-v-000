class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    real_name = self.name
    slug_name = real_name.downcase.gsub(" ","-")

    slug_name
  end

  def self.find_by_slug(slug)
    found_slug = Song.all.find do |s|
      s.slug == slug
    end
    found_slug
  end
end
