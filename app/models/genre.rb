class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    # binding.pry
    Genre.all.find do |genre|
      slug == genre.slug
    end
  end

end
