class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # --add a hyphen between the your name
  def slug
    self.name.downcase.sub(" ","-")
  end
  
  # --find by original name before the name became a slug
  def self.find_by_slug(slug)
   name = slug.split("-").map { |word| word.capitalize }.join(" ")
   self.find_by_name(name)
  end

end
