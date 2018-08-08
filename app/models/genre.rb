class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    a = self.name.downcase
    #binding.pry
    if a.gsub!(/[!@% &"]/,'-')
      slug = a
      #binding.pry
    else
      slug = a
    end
    slug
  end

  def self.find_by_slug(slug)
    value = nil
    Genre.all.each do |genre|
      #binding.pry
      if genre.slug == slug
        #binding.pry
        #val = artist
        value = genre
      end
    end
    value
  end
  
end
