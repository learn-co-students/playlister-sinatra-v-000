require_relative './concerns/slugifiable.rb'

class SongGenre < ActiveRecord::Base 
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  belongs_to :genre
  belongs_to :song
end 