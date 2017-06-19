class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug_name = self.name.gsub(/[^a-zA-Z]/,'-').downcase
  end

  def self.find_by_slug(slug)
    Song.all.find {|a| a.slug === slug}
  end


end
