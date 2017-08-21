class Song < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
end
