class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slugname)
    # binding.pry
    self.all.find {|item| item.slug==slugname}
  end
end
