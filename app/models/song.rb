class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres
  @@songs = []
  def initialize(params)
    @name = name
    @artist = artist
    @genre = genre
    @@songs << self
  end

  def self.all
    @@songs
  end
end
