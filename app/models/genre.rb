class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    slug = self.name.to_s.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|song| song.slug == slug}
  end

end
