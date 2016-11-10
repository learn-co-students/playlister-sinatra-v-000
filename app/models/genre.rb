require_relative './concerns/slug.rb'

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Slug::InstanceMethod
  extend Slug::ClassMethod
end
