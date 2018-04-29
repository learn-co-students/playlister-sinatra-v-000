class Genre < ActiveRecord::Base
  # include Slug::InstanceMethods
  # extend Slug::ClassMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Genre.all.find{|obj| obj.slug == slug}
  end

end
