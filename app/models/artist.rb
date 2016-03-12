require_relative './concerns/slugs'

class Artist < ActiveRecord::Base
  extend Slugs::ClassSlug
  include Slugs::InstanceSlug

  has_many :songs
  has_many :genres, through: :songs

end
