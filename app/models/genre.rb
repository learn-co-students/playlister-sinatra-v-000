class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(arg)
    self.all.find{|genre| genre.slug == arg}
  end

end
