class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugify.slug(self.name)
  end

  def self.find_by_slug(slug)

    self.all.find { |name| name.slug == slug}
    # find_by_name(Slugify.unslug(slug))
  end

end
