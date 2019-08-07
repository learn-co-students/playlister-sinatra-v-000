class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists
  has_many :artists, through: :songs

  def slug
      unless self.name == nil
        self.name.gsub(/ /, '-').downcase
      end 
  end

  def self.find_by_slug(slug)
    genre_name = slug.gsub(/-/, ' ')
    Genre.all.each do |genre|
      if genre.name.downcase == genre_name
        @genre = genre
      end
    end
    @genre
  end
end
