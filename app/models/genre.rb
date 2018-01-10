class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.gsub(/\s+/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.find do |a|
      a.slug == slug
    end
  end
end
