class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist

  def slug
    new_name = name.downcase
    new_name.gsub(' ', '-')
  end

  def self.find_by_slug(name_slug)
    Song.all.find{|a| a.slug == name_slug}
  end
end
