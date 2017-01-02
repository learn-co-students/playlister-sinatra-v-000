class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  def slug
    name.downcase.gsub(' ', '-')
  end
  def self.find_by_slug (s)
    all.each{|e| if e.slug==s then return e end}
  end
end
