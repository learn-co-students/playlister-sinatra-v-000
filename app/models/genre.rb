class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    new_name = name.downcase
    new_name.gsub(' ', '-')
  end

  def self.find_by_slug(name_slug)
    Genre.all.find{|a| a.slug == name_slug}
  end
end
