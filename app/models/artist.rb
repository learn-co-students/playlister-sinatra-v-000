class Artist < ActiveRecord::Base 
    include Sluggify::InstanceMethods
    extend Sluggify::ClassMethods
    has_many :songs
    has_many :genres, through: :songs
end