class Artist < ActiveRecord::Base
  include InstanceMethods
  extend ClassMethods
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    name = slug.split("-").join(" ")
    self.where("lower(name) = ?", name.downcase).first
  end

end
