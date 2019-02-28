require_relative "../models/concerns/slugafiable.rb"

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  #extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods

  def self.find_by_slug(slug)
    self.all.find{|instance|  instance.slug == slug}
  end
end
