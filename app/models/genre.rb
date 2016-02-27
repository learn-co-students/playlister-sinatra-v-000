class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def slug
    self.name.gsub(/(\s|\W)/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.detect{|a| a.slug == slug}
  end

end