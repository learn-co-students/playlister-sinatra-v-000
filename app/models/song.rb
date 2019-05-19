require_relative './concerns/slugifiable.rb'

class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(/\s/, '-').gsub(/[^a-zA-Z\d-]/, '').downcase
  end
  
  def self.find_by_slug(slug)
    self.all.find {|obj| obj.slug == slug}
  end
  
end