class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    include Slugable::InstanceMethods
    extend Slugable::ClassMethods

end