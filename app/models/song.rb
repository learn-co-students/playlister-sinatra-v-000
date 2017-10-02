class Song < ActiveRecord::Base

  include Slugify::Slug
  extend Slugify::FindBySlug

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
