class Artist < ActiveRecord::Base
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|i| i.name.parameterize == slug}
  end
end
