class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres

  def slug
    real_name = self.name
    slug_name = real_name.downcase.gsub(" ","-")

    slug_name
  end

  def self.find_by_slug(slug)
    found_slug = Genre.all.find do |g|
      g.slug == slug
    end
    found_slug
  end
end
