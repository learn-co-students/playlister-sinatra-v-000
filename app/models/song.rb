class Song < ActiveRecord::Base
  extend ClassMethods
  include InstanceMethods
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def self.find_by_slug(slug)
    name = slug.split("-").join(" ")
    self.where("lower(name) = ?", name.downcase).first
  end

end
