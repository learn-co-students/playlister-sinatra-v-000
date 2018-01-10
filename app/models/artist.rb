class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/\s+/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.find do |a|
      a.slug == slug
    end
  end
end
