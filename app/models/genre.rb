class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    title = []
    a = slug.split("-")
    a.each do |word|
      if word == "with" || word == "the" || word == "a"
        title << word
      else
        title << word[0].upcase + word.slice(1..-1)
      end
    end
    genre_title = title.join(" ")
    self.find_by_name(genre_title)
  end
end
