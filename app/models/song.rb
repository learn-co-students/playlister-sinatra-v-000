class Song < ActiveRecord::Base
  include Slug
  extend ClassSlug
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
