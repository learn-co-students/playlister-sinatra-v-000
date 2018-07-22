require 'pry'
class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |genre|
      if genre.slug == slug
        genre
      end
    end
  end
end
