class Artist < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
  has_many :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.detect{|item| item.slug == slug}
  end
end
