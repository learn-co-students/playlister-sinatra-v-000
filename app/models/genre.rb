require_relative '../../lib/slug.rb'

class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
