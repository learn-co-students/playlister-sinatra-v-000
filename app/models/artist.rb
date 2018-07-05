class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugify.slug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find { |name| name.slug == slug}
    # below works in shotgun not with test
    # find_by_name(Slugify.unslug(slug))
  end

end
