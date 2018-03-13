class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    self.all.detect {|instance| instance.slug == slug}
  end

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
