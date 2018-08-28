require_relative './slugify.rb'
class Artist < ActiveRecord::Base
  extend Slugify

  before_save do
    self.slug = self.class.make_slug(name)
  end

  has_many :songs
  has_many :genres, through: :songs
end
