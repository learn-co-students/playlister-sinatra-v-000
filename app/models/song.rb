class Song < ActiveRecord::Base
  belongs_to :artist
  has_and_belongs_to_many :genres, join_table: :songs_genres
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
