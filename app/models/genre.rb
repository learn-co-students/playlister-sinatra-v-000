class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").collect do |t|
      t.downcase
    end.join("-")
  end

  def self.find_by_slug(arg)
    Genre.all.find do |t|
      t.slug == arg
    end
  end

end