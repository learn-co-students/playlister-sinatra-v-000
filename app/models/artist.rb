class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.strip.downcase.gsub /\W+/, '-'
  end

  def self.find_by_slug(slug)
    self.find {|obj| obj.slug == slug}
  end
end
