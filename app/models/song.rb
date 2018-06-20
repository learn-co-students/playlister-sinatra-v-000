class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    # binding.pry
    x = self.name.split(" ")
    x = x.collect do |word|
      word.downcase
    end
    x.join("-")
  end


  def self.find_by_slug(slug)
    # binding.pry
    x = slug.split("-").collect do |word|
      word.capitalize
    end
    song_name = x.join(" ")
    Song.find_by_name(song_name)
  end

end
