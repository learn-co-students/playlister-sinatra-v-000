class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  attr_reader :slug

  def slug
    self.name.gsub(/(\s|\W)/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.detect{|a| a.slug == slug}
  end
 

end