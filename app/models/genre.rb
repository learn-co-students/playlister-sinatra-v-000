class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ')
    all_genres = Genre.all
    all_genres.each do |genre|
      if genre.name.downcase! == unslug
        genre.name = genre.name.titleize
        return genre
      end
    end
  end

end
