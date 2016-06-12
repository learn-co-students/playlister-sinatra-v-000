class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    #binding.pry
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    #binding.pry
    i_slug = slug.split('-').collect{|i| i.capitalize}.join(" ")
    self.find_by(name: i_slug)
  end
end
