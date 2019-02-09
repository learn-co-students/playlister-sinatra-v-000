class Song < ActiveRecord::Base
	has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def slug
      self.name.strip.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
      self.all.find {|item| item.slug == slug}
  end

end