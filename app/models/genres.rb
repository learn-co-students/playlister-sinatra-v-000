#An Artist can have multiple songs and multiple genres
#A Genre can have multiple artists and multiple songs

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    new_name = self.name.downcase
    new_name.gsub!(/[!@%&"]/,'')
    new_name.gsub!(/\s/,'-')
  end

  def self.find_by_slug(slug)
    self.all.each do |genre|
      if genre.slug == slug
        return genre
      end
    end
    return nil
  end
end
