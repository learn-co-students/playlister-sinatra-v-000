class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
  end

end
