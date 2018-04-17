class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugifiable.new(name).slug
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ")
    Genre.all.find{|g| g.name.downcase == name}
  end
end
