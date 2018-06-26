class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    reverse_slug = slug.gsub("-"," ").split.map{|w| w}.join(" ")
    self.all.each do |genre|
      if !(genre.name.downcase == reverse_slug)
      else
        @genre_name = genre.name
      end
    end
    self.all.find_by(name: @genre_name)
  end

end
