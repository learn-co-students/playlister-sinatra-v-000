require_relative 'concerns/slugifiable' 

class SongGenre < ActiveRecord::Base
    belongs_to :genre
    belongs_to :song 


    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end