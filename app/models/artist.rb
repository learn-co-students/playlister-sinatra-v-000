class Artist < ActiveRecord::Base
include Slugifidable::InstanceMethods
extend Slugifidable::ClassMethods
has_many :songs
has_many :genres, :through => :songs 
end 