class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    a = self.name.downcase
    slug = a.gsub!(/[!@% &"]/,'-')
  end

  def self.find_by_slug(slug)
    value = nil
    Song.all.each do |song|
      #binding.pry
      if song.slug == slug
        #binding.pry
        #val = artist
        value = song
      end
    end
    value
  end
  
end
