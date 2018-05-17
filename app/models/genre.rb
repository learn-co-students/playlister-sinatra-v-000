class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists
  has_many :artists, through: :songs

  def slug
    name = self.name.downcase
    name_array = name.split(" ")
    name_array.join("-")
  end

  def self.find_by_slug(slug)
    slug_array = slug.split("-")
    name_joined = slug_array.join(" ")
    self.all.each do |genre|
      if genre.name.casecmp(name_joined) == 0
        return genre
      end
    end
  end

end
