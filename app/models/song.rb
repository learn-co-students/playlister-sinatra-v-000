class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").collect do |t|
      t.downcase
    end.join("-")
  end

  def self.find_by_slug(arg)
    Song.all.find do |t|
      t.slug == arg
    end
  end

end
