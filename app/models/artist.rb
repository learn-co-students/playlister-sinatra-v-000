class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    slug
  end

  def self.find_by_slug(slug)
    self.all.detect {|artist| artist.slug == slug}
  end
end
