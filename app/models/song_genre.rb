require_relative "./concerns/slugifiable.rb"
 class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
end