class Genre< ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    genre = self.name.downcase
    split_genre = genre.split(" ")
    new_genre =split_genre.join("-")

    return new_genre
  end

  def self.find_by_slug(slug)
    split_name = slug.split("-")
    new_genre = split_name.join(" ")
    Genre.all.each do |genre|
      original_genre = genre.name.downcase
      if original_genre == new_genre
        return genre
      end
    end
  end

end
