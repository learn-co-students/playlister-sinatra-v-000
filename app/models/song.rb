class Song < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :artist
  has_many :songs_genres
  has_many :genre, through: :songs_genres


  def slug
  self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
   Song.all.find do |song|
     song.slug == slug
   end
 end

end
