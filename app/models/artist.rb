class Artist<ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug
    artist = self.name.downcase
    split_artist = artist.split(" ")
    new_artist =split_artist.join("-")

    return new_artist
  end

  def self.find_by_slug(slug)
    split_name = slug.split("-")
    new_artist = split_name.join(" ")
    Artist.all.each do |artist|
      original_artist = artist.name.downcase
      if original_artist == new_artist
        return artist
      end
    end
  end

end
