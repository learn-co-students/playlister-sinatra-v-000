class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs

    @@genres = []
    def initialize(params)
      @artist = artist
      @@genres << self
    end

    def self.all
      @@genres
    end
end
