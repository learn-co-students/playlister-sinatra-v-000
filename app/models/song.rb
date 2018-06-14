class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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
    song_title = title.join(" ")
    self.find_by_name(song_title)
  end
end
