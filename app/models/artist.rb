class Artist < ActiveRecord::Base
  # Artist can have many songs
  has_many :songs
  # Artist can have many Genres have many Songs
  has_many :genres, :through => :songs
  
  def slug
    # @name for some reason => nil
    # name => "Taylor Swift"
    # binding.pry
    # slugName = name.gsub(" ", "-")
    # slugName.downcase
    name.gsub(" ", "-").downcase
  end
  
  def self.find_by_slug(slug)
    Artist.all.find { |artist| artist.slug == slug}
  end
end