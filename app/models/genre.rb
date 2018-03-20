class Genre < ActiveRecord::Base
  has_and_belongs_to_many :songs, join_table: :songs_genres
  has_many :artists, through: :songs
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
