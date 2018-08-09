class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    name = self.name
    split = name.split(" ")
    downcased = []
    split.map {|word| downcased << word.downcase}
    joined = downcased.join("-")
    joined
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      song.slug == slug
    end
  end
  
end
