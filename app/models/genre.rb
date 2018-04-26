class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(genre_name)
    genre = Genre.find_by_name(genre_name.gsub('-', ' ').split(" ").map(&:capitalize).join(" "))
  end

end
