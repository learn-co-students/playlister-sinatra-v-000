class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :song_genres
  has_many :genres, through: :song_genres

  # has_and_belongs_to_many :genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ").split.map{|v| v.capitalize}.join(" ")
    Song.find_by(name: name)
  end


  # def song_genres
  #   binding.pry
  #
  # end

end
