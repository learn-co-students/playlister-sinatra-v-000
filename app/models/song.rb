class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    return self.name.gsub(/[^a-zA-Z0-9]+/,'-').downcase
  end
  
  def self.find_by_slug(slug)
    selected = self.all.select do |artist|
      artist.slug == slug
    end
    if selected.empty?
      "No found"
    else
      selected.first
    end
  end
  
end