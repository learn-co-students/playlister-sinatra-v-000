require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-')
  end

  def self.find_by_slug(slug)
    char = slug.gsub('-', ' ')
    self.all.detect {char}
  end

  binding.pry
end
