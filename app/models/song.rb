class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  # validates_uniqueness_of :name, :case_sensitive => false

  def slug
    self.name.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ")
    self.find_by(:name => name)
  end

end
