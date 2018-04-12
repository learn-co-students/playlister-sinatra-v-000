class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(/\s+/, '-')
  end

  def self.find_by_slug(slug)
    self.all.detect {|element| element.slug == slug}
  end

end
