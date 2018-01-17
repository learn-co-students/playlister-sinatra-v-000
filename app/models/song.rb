class Song < ActiveRecord::Base

  include Slug::Instance
  extend Slug::Class

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
