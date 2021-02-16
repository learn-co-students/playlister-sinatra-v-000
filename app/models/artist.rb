class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    extend Sluggable::ClassMethods #self.find_by_slug
    include Sluggable::InstanceMethods #slug

end