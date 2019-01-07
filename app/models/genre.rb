class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    unslugged = slug.split("-")
    self.all.map do |genre|
      if genre.name.downcase.include?(unslugged[0]) && genre.name.downcase.include?(unslugged[1])
        unslugged = genre
      end
    end
    self.find_by_name(unslugged.name)
  end
end
