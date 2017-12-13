class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  include Slug::InstanceMethods
  extend Slug::ClassMethods
end
