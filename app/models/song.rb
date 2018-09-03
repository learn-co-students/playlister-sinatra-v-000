class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  include Slugifiable::Slug
  extend Slugifiable::FindBySlug
end
