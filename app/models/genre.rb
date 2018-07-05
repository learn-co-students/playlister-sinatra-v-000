class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugify.slug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find { |name| name.slug == slug}
    # find_by_name(Slugify.unslug(slug))
  end

end
