class Artist < ActiveRecord::Base
  # include Slug::InstanceMethods
  # extend Slug::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
    # obj = self.name.downcase
    # obj.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|obj| obj.slug == slug}
  end

end
