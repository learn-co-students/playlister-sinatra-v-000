class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug 
    self.name.split.map { |el| el.downcase}.join("-")
  end


  def self.find_by_slug(slug)  # need the string you undid above to revert to its original object based on the slug name
    target = slug.split("-").map { |el| el.capitalize}.join(" ")

    Song.all.detect do |song|
      song.name == target 
    end
  end


end