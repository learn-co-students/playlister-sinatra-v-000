class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.new.slug(self)
  end

  def self.find_by_slug(text)
    Slugifiable.find_by_slug(text, self)
    #Artist.find_by_name(text.split("-").collect {|text| text.capitalize}.join(" "))
  end
end