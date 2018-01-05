class Song <ActiveRecord::Base
  belongs_to :artists
  has_many :song_genres
  has_many :genres, through: :song_genres

  def inspect
    "Name: #{self.name}, Artist: #{self.artist.inspect}"
  end

  def slug
    self.name.downcase.split(/\s|\.\W/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.each do |song|
      return song if song.slug == slug
    end
  end

end
