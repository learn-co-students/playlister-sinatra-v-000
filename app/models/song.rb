class Song < ActiveRecord::Base
  # include SlugModule::InstanceMethods
  # extend SlugModule::ClassMethods
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slugged = self.name.gsub(/[^0-9A-Za-z]/, '-').downcase
    slugged
  end

  def self.find_by_slug(slug)
    self.all.detect do |s|
      s if s.slug == slug
    end
  end
end
