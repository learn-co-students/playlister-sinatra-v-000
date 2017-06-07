class Song < ActiveRecord::Base
  extend Parser::ClassMethods
  include Parser::InstanceMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
