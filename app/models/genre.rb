class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    new_name = self.name.downcase.split(" ")
    new_name.join("-")
  end

  def self.find_by_slug(name)
    unslug_name = name.split("-")
    unslugged = unslug_name.join(" ")
    Genre.where("LOWER(name) = ?", "#{unslugged}").first
  end

end
