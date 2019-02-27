class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods

  def slug
    name = self.name
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|instance| instance.slug == slug}
  end
end
