class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-").gsub("\'", "")
  end

  def self.find_by_slug(item)
    Song.all.find{|s| s.slug == item}
  end

end
