
class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Slugifiable::Slug


  def self.find_by_slug(slug)
  normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
  Genre.all.find_by({name: normalize})
  end


end
