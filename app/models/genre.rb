class Genre < ActiveRecord::Base
  # Genre has many Song_Genres
  has_many :song_genres
  # Genre has many Songs because of Song_Genres
  has_many :songs, through: :song_genres
  # Genre has many Artists because of Songs
  has_many :artists, through: :songs
  
  def slug
    # @name for some reason => nil
    # name => "Taylor Swift"
    # binding.pry
    # slugName = name.gsub(" ", "-")
    # slugName.downcase
    name.gsub(" ", "-").downcase
  end
  
  def self.find_by_slug(slug)
    Genre.all.find { |g| g.slug == slug}
  end
  
end