class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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
