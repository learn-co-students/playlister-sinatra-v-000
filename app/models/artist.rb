class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods



  def self.find_by_slug(slug)
      Artist.all.find {|artist| artist.slug == slug }
  end
end
