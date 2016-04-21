class Artist < ActiveRecord::Base
  has_many :songs

  def slug
  	x = self.name
  	x = x.downcase.gsub(/[^a-z ]/,"").gsub(" ","-")
    x
  end

  def genres
    x = []
    self.songs.each do |song|
      song.genres.each do |genre|
        x << genre
      end
    end
    x = x.uniq
    x
  end

  def self.find_by_slug(slug)
  	x = Artist.all.find do |a|
  		a.slug == slug
  		end
    x
  end

end
