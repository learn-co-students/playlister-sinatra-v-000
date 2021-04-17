class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
