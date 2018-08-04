class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(name)
    reg_name = name.titleize
    Song.find_by_name(reg_name)
    end
end
