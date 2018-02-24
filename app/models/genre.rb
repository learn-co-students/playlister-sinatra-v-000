class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find { |instance| instance.slug == slug}
  end
end
