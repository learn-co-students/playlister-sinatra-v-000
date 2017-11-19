class Genre < ActiveRecord::Base
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
  has_many :song_genres


  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.find { |genre| genre.slug == slug}
  end
end
