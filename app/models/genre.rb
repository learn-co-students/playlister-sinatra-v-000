class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres


  def slug
  	x = self.name
  	x = x.downcase.gsub(/[^a-z ]/,"").gsub(" ","-")
    x
  end

  def artists
    x = self.songs.collect {|x|x.artist}
    x.uniq!
    x
  end

  def self.find_by_slug(slug)
  	x = Genre.all.find do |a|
  		a.slug == slug
  		end
    x
  end



end
