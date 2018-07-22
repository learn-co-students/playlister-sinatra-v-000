class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |genre|
      if genre.slug == slug
        genre
      end
    end
  end

end
