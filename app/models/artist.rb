class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

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
    artist_title = title.join(" ")
    self.find_by_name(artist_title)
  end
end
