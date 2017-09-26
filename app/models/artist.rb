class Artist < ActiveRecord::Base
include Slugifiable
    has_many :songs
    has_many :genres, through: :songs

    def self.find_by_slug(name)
      self.all.detect do |i|
        i.slug == name
      end
    end
end
