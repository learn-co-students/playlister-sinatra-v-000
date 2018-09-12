class Song < ActiveRecord::Base
  require_relative '../models/concerns/slugifiable.rb'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
end