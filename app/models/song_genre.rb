class SongGenre < ActiveRecord::Base
    belongs_to :song
    belongs_to :genre
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
end