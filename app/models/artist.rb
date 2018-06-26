class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, :through => :songs

    extend Paramable::ClassMethods
    include Paramable::InstanceMethods
end