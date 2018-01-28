class Song < ActiveRecord::Base
  include Slugible::InstanceMethods
  extend Slugible::ClassMethods

  belongs_to :artist
  has_many :genre_songs
  has_many :genres, through: :genre_songs
end
