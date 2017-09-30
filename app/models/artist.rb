require_relative "../../lib/slugify.rb"

class Artist < ActiveRecord::Base

  include Slugify::Slug
  extend Slugify::FindBySlug

  has_many :songs
  has_many :genres, through: :songs

end
