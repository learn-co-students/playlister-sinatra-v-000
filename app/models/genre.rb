class Genre < ActiveRecord::Base
  include InstanceMethods
  extend ClassMethods
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres

  def self.find_by_slug(slug)
    name = slug.split("-").join(" ")
    self.where("lower(name) = ?", name.downcase).first
  end

end
