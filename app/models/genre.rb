require_relative "../models/concerns/slugafiable.rb"

class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  #extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods

  def self.find_by_slug(slug)
    self.all.find{|instance|  instance.slug == slug}
  end
end
