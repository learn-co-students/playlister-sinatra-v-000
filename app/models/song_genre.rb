

class SongGenre < ActiveRecord::Base
    belongs_to :song
    belongs_to :genre

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end