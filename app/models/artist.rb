require_relative "../helpers/support_modules"

class Artist < ActiveRecord::Base
  include Slugs

  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    name = Slugs.unslug(slug)
    self.find_by_name(name)
  end
end
