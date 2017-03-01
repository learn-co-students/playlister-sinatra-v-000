class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, through: :songs

  def slug
    slug = self.name.downcase.strip.gsub(' ', '-')
    slug
  end

  def self.find_by_slug(slug)
    genre = self.all.detect {|s| s.slug == slug}
    genre
  end



end
