class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :songs
  has_many :genres, through: :songs
end

# Artist.create(name: "Tiana")
#   => #<Artist:0x007ff56189b468 id: 1, name: "Tiana">
