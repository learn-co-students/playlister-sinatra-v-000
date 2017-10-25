class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugifiable.new.slug(self)
  end

  def self.find_by_slug(text)
    Slugifiable.find_by_slug(text, self)
    #Artist.find_by_name(text.split("-").collect {|text| text.capitalize}.join(" "))
  end
end