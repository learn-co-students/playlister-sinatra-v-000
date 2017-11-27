class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

include Slugifiable::Slug

  def self.find_by_slug(slug)
  normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
  Song.all.find_by({name: normalize})
  end


end
