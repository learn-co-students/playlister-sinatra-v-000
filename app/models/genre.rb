class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").collect do |word|
      if word == "with" || word == "the" || word == "a"
        word
      else
        word.capitalize
      end 
    end
    self.find_by({name: name.join(" ")})
  end
end