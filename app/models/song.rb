class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.downcase
    name_array = name.split(" ")
    name_array.join("-")
  end

  def self.find_by_slug(slug)
    slug_array = slug.split("-")
    name_joined = slug_array.join(" ")
    self.all.each do |song|
      if song.name.casecmp(name_joined) == 0
        return song
      end
    end
  end

end
