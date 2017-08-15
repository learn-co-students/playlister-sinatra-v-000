class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
  end

  def self.find_by_slug(slug)
    # use FIND method to find genre from Genre.all whos slug == slug argument provided
    Genre.all.find{|genre| genre.slug == slug}
  end
end
