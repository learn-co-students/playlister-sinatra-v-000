class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    @slug = name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    Genre.all.detect{|genre| genre.slug == slug}
  end
end
