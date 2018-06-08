class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |my_obj|
      my_obj.slug == slug
    end
  end
end
