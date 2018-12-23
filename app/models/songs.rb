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
end
