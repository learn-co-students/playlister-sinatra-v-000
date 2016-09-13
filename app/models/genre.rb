class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

   def slug 
    self.name.split.map { |el| el.downcase}.join("-")
  end


  def self.find_by_slug(slug)  # need the string you undid above to revert to its original object based on the slug name
    target = slug.split("-").map { |el| el.capitalize}.join(" ")

    Genre.all.detect do |song|
      song.name == target 
    end
  end

end