class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres  #this is used to establish the connection to the join table so all other connections can be establisded
  has_many :genres, through: :song_genres

  include Slugable::InstanceMethods
  extend  Slugable::ClassMethods
end
