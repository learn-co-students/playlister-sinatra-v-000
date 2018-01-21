class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
  #Taylor Swift -> taylor-swift
    name.downcase.gsub(" ", "-") unless name.nil?
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      song.slug == slug
    end
  end
end
