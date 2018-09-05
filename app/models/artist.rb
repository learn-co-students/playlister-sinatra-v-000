class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name
    slug = name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.detect{|x|x.slug == slug}
  end
end
