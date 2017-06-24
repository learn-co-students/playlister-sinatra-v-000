class Artist < ActiveRecord::Base
include Slugfindable::InstanceMethods
extend Slugfindable::ClassMethods
has_many :songs
has_many :genres, :through => :songs 
end 