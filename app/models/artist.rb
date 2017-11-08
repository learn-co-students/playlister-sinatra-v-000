class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, {through: :songs, source: :genre}

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
