class Song < ActiveRecord::Base
  # Song only belongs to Artist
  belongs_to :artist
  # Song can have many Song_Genres
  has_many :song_genres
  # Song can have many Genres because of Song_Genres
  has_many :genres, through: :song_genres
  
  def slug
    # @name for some reason => nil
    # name => "Taylor Swift"
    # binding.pry
    # slugName = name.gsub(" ", "-")
    # slugName.downcase
    name.gsub(" ", "-").downcase
  end
  
  def self.find_by_slug(slug)
    Song.all.find { |song| song.slug == slug}
  end
end