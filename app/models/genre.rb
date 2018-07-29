class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(/ /,'-')
  end

  def find_by_slug
    find = self.name.gsub(/-/,' ').upcase
    find_by_name(find)
  end

end # Genre
