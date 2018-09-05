class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def self.find_by_slug(slug)
    self.all.detect{|x|x.slug == slug}
  end

  def slug
    name = self.name
    slug = name.downcase.strip.gsub(' ', '-')
  end
 end
