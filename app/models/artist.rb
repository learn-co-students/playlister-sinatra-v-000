class Artist < ActiveRecord::Base
  #include Slugifiable::InstanceMethods
  #extend Slugifiable::ClassMethods
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    self.all.find {|object| object.name if object.slug == slug}
  end

  def slug
    name.downcase.split.join("-")
  end
end
