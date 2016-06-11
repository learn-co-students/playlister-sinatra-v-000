class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

    @@artists = []
    def initialize(params)
      @name = name
      @genre = genre
      @@artists << self
    end

    def self.all
      @@artists
    end
  end
