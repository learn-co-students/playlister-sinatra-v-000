class Song < ActiveRecord::Base
  require 'pry'
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
   all.find {|item| item.slug == slug}
  end
  #binding.pry

end
