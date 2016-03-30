class Genre < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres

  def slug
    self.name.downcase.gsub(/[[:punct:]]/,'').gsub(/\s/,'-')
  end

  def self.find_by_slug(slug)
    Genre.all.each do |genre|
      return genre if genre.slug == slug
    end
  end
end
