class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    new_name = self.name.downcase.split(" ")
    new_name.join("-")
  end

  def self.find_by_slug(name)
    unslug_name = name.split("-")
    unslugged = unslug_name.join(" ")
    # binding.pry
    Song.where("LOWER(name) = ?", "#{unslugged}").first
  end

end
