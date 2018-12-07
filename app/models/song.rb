class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    dont_capitalize = ['a','the','and','with']
    titlename = slug.split('-').map{|word| dont_capitalize.include?(word) ? word : word.titleize }.join(' ')
    self.find_by_name(titlename)
  end


end
