class Song < ActiveRecord::Base
  require_relative '../../lib/slug_methods.rb'
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  extend SlugMethods::ClassMethods
  include SlugMethods::InstanceMethods
end
