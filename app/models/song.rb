class Song < ActiveRecord::Base

  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(/[,._?!@$%#&*()+:;|\/"^' ]/, '-')
  end

  def self.find_by_slug(slug)
    Song.all.each do |a|
      if a.slug == slug
        return a
      end
    end
  end
end
