class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    #reverse_slug = slug.gsub("-"," ").split.map{|w| w.capitalize}.join(" ")
    reverse_slug = slug.gsub("-"," ").split.map{|w| w}.join(" ")
    self.all.each do |song|
      if !(song.name.downcase == reverse_slug)
      else
        @song_name = song.name
      end
    end
    self.all.find_by(name: @song_name)
  end

end
