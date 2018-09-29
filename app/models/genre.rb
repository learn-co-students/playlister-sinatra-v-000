class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    slug = self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    slug
  end

  def self.find_by_slug(slug)
    self.all.detect {|genre| genre.slug == slug}
  end
end
