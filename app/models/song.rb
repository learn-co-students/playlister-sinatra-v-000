class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres

  def slug
    self.name.gsub(/(\s|\W)/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.detect{|a| a.slug == slug}
  end

end