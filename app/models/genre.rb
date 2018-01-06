class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    @slug = name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-')
  end

  def find_by_slug(slug)
    char = slug.gsub('-', ' ')
    self.all.detect {char}
  end
end
