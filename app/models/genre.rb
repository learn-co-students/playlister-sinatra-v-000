class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").collect {|item| item.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find {|genre| genre.slug == slug}
  end

end
