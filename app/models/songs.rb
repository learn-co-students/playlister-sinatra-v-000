class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    new_name = self.name.downcase
    new_name.gsub!(/[!@%&"]/,'')
    new_name.gsub!(/\s/,'-')
  end

  def self.find_by_slug(slug)
    self.all.each do |song|
      if song.slug == slug
        return song
      end
    end
    return nil
  end

  def replace_genres(new_genres_ids_list)
    @genres.each do |genre|
      self.genres.delete(genre)
    end
    new_genres_list.each do |genre_id|
      genre = Genre.find_by_id(genre_id)
      self.genres << genre
    end
  end
end
