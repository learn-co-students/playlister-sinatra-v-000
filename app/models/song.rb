class Song < ActiveRecord::Base
  # include Slug::InstanceMethods
  # extend Slug::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Song.all.find{|obj| obj.slug == slug}
  end

end
