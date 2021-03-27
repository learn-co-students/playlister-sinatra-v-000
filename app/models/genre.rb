class Genre < ActiveRecord::Base
  # Reviewed solution - I had this wrong to begin with, the only initial cirrect was has_many :artists, through: :songs
  # Because songs can have many genres, I can't do the simple has_many :songs I started with, I had to immediately started
  # the has_many :songs through: :song_genres as well as the has_many :song_genres
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(/[" "]/,"-")
  end

  def self.find_by_slug(slug)
    Genre.all.find {|genre| genre.slug == slug}
  end

end
