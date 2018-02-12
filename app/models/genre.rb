class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    genre = self.name
    "#{genre.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.sluggify(name)
    Genre.all.detect do |genre|
      if genre.slug == name
        self.find_by_name(genre.name)
        @genre
      else
        @genre = nil
      end
    end
  end

  def self.find_by_name(name)
    @genre = Genre.find_by name: name
  end

  def self.find_by_slug(slug)
    self.sluggify(slug)
  end

end
