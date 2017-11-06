class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    if self.name
      slugger = self.name.gsub(' ','-').downcase
      @slug = slugger.gsub(/^[-]\W/,'')
      self.slug = @slug
      @slug
    
    end
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      genre.slug == slug
    end
  end
end
