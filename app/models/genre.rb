class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres


  def slug
    slug_name = self.name.gsub(/[^a-zA-Z]/,'-').downcase
  end

  def self.find_by_slug(slug)
    Genre.all.find {|a| a.slug === slug}
  end



end
