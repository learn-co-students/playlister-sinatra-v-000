class Song < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  has_many :genres, through: :song_genres
  has_many :song_genres
  belongs_to :artist
end
